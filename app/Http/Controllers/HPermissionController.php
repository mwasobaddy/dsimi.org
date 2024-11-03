<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use App\Models\Employee;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Services\HourlyLeaveCertificateService;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class HPermissionController extends Controller
{
    protected $certificateService;

    public function __construct(HourlyLeaveCertificateService $certificateService)
    {
        $this->certificateService = $certificateService;
    }
    public function index()
    {
        $permissions = Permission::where('user_id', Auth::user()->id)->get();

        if ($permissions && \Auth::user()->type == 'employee') {
            // Pass the permissions data to the view and display the success message
            return view('hpermissions.index', compact('permissions'))->with('success', 'Permission request submitted successfully.');
        } 
        else if($permissions && \Auth::user()->type == 'Line Manager (Employee)') {
            $user     = \Auth::user();
                
            $permissions = Permission::where('supervisor_name', '=', \Auth::user()->name)->get();

            return view('hpermissions.index', compact('permissions'))->with('success', 'Permission request submitted successfully.');

        }
        else {
            // Display the view with an error message
            return view('hpermissions.index', compact('permissions'))->with('error', 'Permissions Not Found');
        }
        
        // $permissions = permission::all();
        // return view('hpermissions.index', compact('permissions'));
    }

    public function create()
    {
        return view('hpermissions.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'request_date' => 'required|date',
            'start_time' => 'required|date_format:H:i',
            'end_time' => 'required|date_format:H:i|after:start_time',
            'reason' => 'nullable|string',
        ]);
    
        // Check for overlapping permission requests
        $existingPermissions = Permission::where('user_id', Auth::user()->id)
            ->where('request_date', $request->request_date)
            ->where(function ($query) use ($request) {
                $query->whereBetween('start_time', [$request->start_time, $request->end_time])
                      ->orWhereBetween('end_time', [$request->start_time, $request->end_time]);
            })
            ->exists();
    
        if ($existingPermissions) {
            return back()->withErrors('There is an overlapping permission request.');
        }
    
        try {
            $employee = Employee::where('user_id', Auth::user()->id)->first();
            
            if (!$employee) {
                return redirect()->back()->with('error', 'Employee record not found.');
            }
    
            if (!$employee->supervisor_n1) {
                return redirect()->back()->with('error', 'Supervisor information is missing.');
            }
    
            $permission = new Permission();
            $permission->user_id = Auth::user()->id;
            $permission->request_date = $request->request_date;
            $permission->start_time = $request->start_time;
            $permission->end_time = $request->end_time;
            $permission->reason = $request->reason;
            $permission->supervisor_name = $employee->supervisor_n1;
            $permission->status = 'pending';
            $permission->save();
    
            return redirect()->route('hpermissions.index')
                ->with('success', 'Permission request submitted successfully.');
                
        } catch (\Exception $e) {
            \Log::error('Permission creation error: ' . $e->getMessage());
            return redirect()->back()
                ->with('error', 'An error occurred while submitting the request: ' . $e->getMessage());
        }
    }

    public function approve(Permission $permission)
    {
        $permission->update(['status' => 'approved']);
        return back()->with('success', 'Permission approved successfully.');
    }

    public function reject(Permission $permission)
    {
        $permission->update(['status' => 'rejected']);
        return back()->with('success', 'Permission rejected successfully.');
    }

    public function getPermission($id)
    {
        $permission = Permission::find($id);

        $employee = Employee::where('user_id', $permission->user_id)->first();

        return view('hpermissions.action', compact('permission', 'employee'));
    }

    public function changeaction(Request $request)
    {
        try {
            // Validate the request
            $request->validate([
                'id' => 'required',
                'status' => 'required|in:Approved,Reject'
            ]);
    
            // Find the permission
            $permission = Permission::find($request->id);
            
            if (!$permission) {
                return back()->with('error', 'Permission not found.');
            }
    
            // Log the incoming data for debugging
            \Log::info('Permission Update Request:', [
                'permission_id' => $request->id,
                'status' => $request->status,
                'permission' => $permission
            ]);
    
            // Update the status
            if ($request->status === 'Approved') {
                $permission->status = 'approved';

                  // Generate certificate
            try {
                $certificateFilename = $this->certificateService->generateCertificate($permission);
                $permission->certificate_path = $certificateFilename;
                Log::info('Certificate generated: ' . $certificateFilename);
            } catch (\Exception $e) {
                Log::error('Certificate generation failed: ' . $e->getMessage());
                Log::error($e->getTraceAsString());
            }
                $permission->save();
                
                \Log::info('Permission Approved:', ['permission_id' => $permission->id]);
                return back()->with('success', 'Permission approved successfully.');
            } 
            elseif ($request->status === 'Reject') {
                $permission->status = 'rejected';
                $permission->save();
                
                \Log::info('Permission Rejected:', ['permission_id' => $permission->id]);
                return back()->with('success', 'Permission rejected successfully.');
            }
    
            return back()->with('error', 'Invalid status provided.');
    
        } catch (\Exception $e) {
            \Log::error('Permission Update Error:', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
            
            return back()->with('error', 'An error occurred while updating the permission status.');
        }
    }
    public function downloadCertificate($permissionId)
{
    $permission = Permission::findOrFail($permissionId);
    
    // Check if user has permission to download
    if (!\Auth::user()->can('Manage Permission') && 
        \Auth::user()->id != $permission->user_id) {
        return redirect()->back()->with('error', __('Permission denied.'));
    }

    // Check if certificate exists
    if (!$permission->certificate_path || 
        !Storage::disk('public')->exists('certificates/' . $permission->certificate_path)) {
        return redirect()->back()->with('error', __('Certificate not found.'));
    }

    return Storage::disk('public')->download(
        'certificates/' . $permission->certificate_path,
        'hourly_leave_certificate_' . $permission->id . '.pdf'
    );
}
}