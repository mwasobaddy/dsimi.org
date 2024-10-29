<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class HPermissionController extends Controller
{
 
    public function index()
    {
        if(\Auth::user()->type == 'employee'){
                $permissions = Permission::where('user_id', Auth::user()->id)->get();
                
                // $permissions = permission::all();
                return view('hpermissions.index', compact('permissions'));
        }
        else if(\Auth::user()->type == 'Line Manager (Employee)'){
            // 
            $permissions = Permission::all();
            return view('hpermissions.index', compact('permissions'));

        }
        else{
            $permissions = Permission::all();
            return view('hpermissions.index', compact('permissions'));

        }
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
        $existingPermissions = Permission::where('id', Auth::id())
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
            Permission::create([
                'id' => Auth::id(),
                'request_date' => $request->request_date,
                'start_time' => $request->start_time,
                'end_time' => $request->end_time,
                'reason' => $request->reason,
                'status' => 'pending',
            ]);
    

            return redirect()->route('hpermissions.index')->with('success', 'Permission request submitted successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('errors', 'An error occurred while submitting the request.');
        }
    }

    public function approve(Permission $permission)
    {
        if(\Auth::user()->type == 'Line Manager (Employee)'){

        $permission->update(['status' => 'approved']);
        return back()->with('success', 'Permission approved successfully.');
        }
    }

    public function reject(Permission $permission)
    {
        if(\Auth::user()->type == 'Line Manager (Employee)'){
        $permission->update(['status' => 'rejected']);
        return back()->with('success', 'Permission rejected successfully.');
        }
    }
}
