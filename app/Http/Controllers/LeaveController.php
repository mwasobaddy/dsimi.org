<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Models\Leave as LocalLeave;
use App\Models\LeaveType;
use App\Services\LeaveCertificateService;
use Illuminate\Support\Facades\Storage;
use App\Mail\LeaveActionSend;
use App\Models\Utility;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Imports\EmployeesImport;
use App\Exports\LeaveExport;
use Maatwebsite\Excel\Facades\Excel;
use Spatie\GoogleCalendar\Event as GoogleEvent;

class LeaveController extends Controller
{
    protected $certificateService;

    public function __construct(LeaveCertificateService $certificateService)
    {
        $this->certificateService = $certificateService;
    }
    public function index()
    {

        if (\Auth::user()->can('Manage Leave')) {
            if (\Auth::user()->type == 'employee') {
                $user     = \Auth::user();
                $employee = Employee::where('user_id', '=', $user->id)->first();
                $leaves = LocalLeave::where('employee_id', '=', $employee->id)->get();
            }
            //////////////////////////////////
            elseif (\Auth::user()->type == 'Line Manager (Employee)') {

                $user     = \Auth::user();

                $employee = Employee::where('user_id', '=', $user->id)->first();
                
                $leaves = LocalLeave::where('supervisor_name', '=', \Auth::user()->name)->with(['employees', 'leaveType'])->get();
            }

            else {
                $leaves = LocalLeave::where('created_by', '=', \Auth::user()->creatorId())->with(['employees', 'leaveType'])->get();
            }

            return view('leave.index', compact('leaves'));
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function create()
    {
        if (\Auth::user()->can('Create Leave')) {
            if (Auth::user()->type == 'employee') {
                $employees = Employee::where('user_id', '=', \Auth::user()->id)->first();
            } else {
                $employees = Employee::where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('name', 'id');
            }
            $leavetypes      = LeaveType::where('created_by', '=', \Auth::user()->creatorId())->get();
            // $leavetypes_days = LeaveType::where('created_by', '=', \Auth::user()->creatorId())->get();

            return view('leave.create', compact('employees', 'leavetypes'));
        } else {
            return response()->json(['error' => __('Permission denied.')], 401);
        }
    }




    public function store(Request $request)
    {
        if (\Auth::user()->can('Create Leave')) {
            $validator = \Validator::make(
                $request->all(),
                [
                    'employee_id' => 'required',
                    'leave_type_id' => 'required',
                    'start_date' => 'required',
                    'end_date' => 'required',
                    'leave_reason' => 'required',
                    'remark' => 'required',
                ]
            );
            if ($validator->fails()) {
                $messages = $validator->getMessageBag();
    
                return redirect()->back()->with('error', $messages->first());
            }
    
            $leave_type = LeaveType::find($request->leave_type_id);
    
            $startDate = new \DateTime($request->start_date);
            $endDate = new \DateTime($request->end_date);
            $endDate->add(new \DateInterval('P1D'));
            $date = Utility::AnnualLeaveCycle();
    
            $employee = Employee::find($request->employee_id);
            if (!$employee) {
                return redirect()->back()->with('error', __('Employee not found.'));
            }
    
            if (\Auth::user()->type == 'employee') {
                $leaves_used = LocalLeave::where('employee_id', '=', $request->employee_id)
                    ->where('leave_type_id', $leave_type->id)
                    ->where('status', 'Approved')
                    ->whereBetween('created_at', [$date['start_date'], $date['end_date']])
                    ->sum('total_leave_days');
    
                $leaves_pending = LocalLeave::where('employee_id', '=', $request->employee_id)
                    ->where('leave_type_id', $leave_type->id)
                    ->where('status', 'Pending')
                    ->whereBetween('created_at', [$date['start_date'], $date['end_date']])
                    ->sum('total_leave_days');
            } else {
                $leaves_used = LocalLeave::where('employee_id', '=', $request->employee_id)
                    ->where('leave_type_id', $leave_type->id)
                    ->where('status', 'Approved')
                    ->whereBetween('created_at', [$date['start_date'], $date['end_date']])
                    ->sum('total_leave_days');
    
                $leaves_pending = LocalLeave::where('employee_id', '=', $request->employee_id)
                    ->where('leave_type_id', $leave_type->id)
                    ->where('status', 'Pending')
                    ->whereBetween('created_at', [$date['start_date'], $date['end_date']])
                    ->sum('total_leave_days');
            }
    
            $total_leave_days = !empty($startDate->diff($endDate)) ? $startDate->diff($endDate)->days : 0;
    
            $return = $leave_type->days - $leaves_used;
            if ($total_leave_days > $return) {
                return redirect()->back()->with('error', __('You are not eligible for leave.'));
            }
    
            if (!empty($leaves_pending) && $leaves_pending + $total_leave_days > $return) {
                return redirect()->back()->with('error', __('Multiple leave entry is pending.'));
            }
    
            if ($leave_type->days >= $total_leave_days) {
                $leave = new LocalLeave();
                if (\Auth::user()->type == "employee") {
                    $leave->employee_id = $request->employee_id;
                } else {
                    $leave->employee_id = $request->employee_id;
                }
                $leave->leave_type_id = $request->leave_type_id;
                $leave->applied_on = date('Y-m-d');
                $leave->start_date = $request->start_date;
                $leave->end_date = $request->end_date;
                $leave->total_leave_days = $total_leave_days;
                $leave->leave_reason = $request->leave_reason;
                $leave->remark = $request->remark;
                $leave->status = 'Pending';
                $leave->created_by = \Auth::user()->creatorId();
                $leave->supervisor_name = $employee->supervisor_n1;
                $leave->save();
    
                // Google calendar
                if ($request->get('synchronize_type') == 'google_calender') {
                    $type = 'leave';
                    $request1 = new GoogleEvent();
                    $request1->title = !empty(\Auth::user()->getLeaveType($leave->leave_type_id)) ? \Auth::user()->getLeaveType($leave->leave_type_id)->title : '';
                    $request1->start_date = $request->start_date;
                    $request1->end_date = $request->end_date;
                    Utility::addCalendarData($request1, $type);
                }
    
                return redirect()->route('leave.index')->with('success', __('Leave successfully created.'));
            } else {
                return redirect()->back()->with('error', __('Leave type ' . $leave_type->title . ' is provide maximum ' . $leave_type->days . "  days please make sure your selected days is under " . $leave_type->days . ' days.'));
            }
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }























    public function show(LocalLeave $leave)
    {
        return redirect()->route('leave.index');
    }

    public function edit(LocalLeave $leave)
    {
        if (\Auth::user()->can('Edit Leave')) {
            if ($leave->created_by == \Auth::user()->creatorId()) {

                if (Auth::user()->type == 'employee') {
                    $employees = Employee::where('employee_id', '=', \Auth::user()->creatorId())->first();
                } else {
                    $employees = Employee::where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('name', 'id');
                }

                // $employees = Employee::where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('name', 'id');

                // $leavetypes = LeaveType::where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('title', 'id');
                $leavetypes      = LeaveType::where('created_by', '=', \Auth::user()->creatorId())->get();

                return view('leave.edit', compact('leave', 'employees', 'leavetypes'));
            } else {
                return response()->json(['error' => __('Permission denied.')], 401);
            }
        } else {
            return response()->json(['error' => __('Permission denied.')], 401);
        }
    }

    public function update(Request $request, $leave)
    {
        $leave = LocalLeave::find($leave);
        if (\Auth::user()->can('Edit Leave')) {
            if ($leave->created_by == Auth::user()->creatorId()) {
                $validator = \Validator::make(
                    $request->all(),
                    [
                        'employee_id' => 'required',
                        'leave_type_id' => 'required',
                        'start_date' => 'required',
                        'end_date' => 'required',
                        'leave_reason' => 'required',
                        'remark' => 'required',
                    ]
                );
                if ($validator->fails()) {
                    $messages = $validator->getMessageBag();

                    return redirect()->back()->with('error', $messages->first());
                }
                $leave_type = LeaveType::find($request->leave_type_id);
                $employee = Employee::where('employee_id', '=', \Auth::user()->creatorId())->first();

                $startDate = new \DateTime($request->start_date);
                $endDate = new \DateTime($request->end_date);
                $endDate->add(new \DateInterval('P1D'));
                // $total_leave_days = !empty($startDate->diff($endDate)) ? $startDate->diff($endDate)->days : 0;
                $date = Utility::AnnualLeaveCycle();

                if (\Auth::user()->type == 'employee') {
                    // Leave day
                    $leaves_used   = LocalLeave::whereNotIn('id', [$leave->id])->where('employee_id', '=', $employee->id)->where('leave_type_id', $leave_type->id)->where('status', 'Approved')->whereBetween('created_at', [$date['start_date'],$date['end_date']])->sum('total_leave_days');

                    $leaves_pending  = LocalLeave::whereNotIn('id', [$leave->id])->where('employee_id', '=', $employee->id)->where('leave_type_id', $leave_type->id)->where('status', 'Pending')->whereBetween('created_at', [$date['start_date'],$date['end_date']])->sum('total_leave_days');
                } else {
                    // Leave day
                    $leaves_used   = LocalLeave::whereNotIn('id', [$leave->id])->where('employee_id', '=', $request->employee_id)->where('leave_type_id', $leave_type->id)->where('status', 'Approved')->whereBetween('created_at', [$date['start_date'],$date['end_date']])->sum('total_leave_days');

                    $leaves_pending  = LocalLeave::whereNotIn('id', [$leave->id])->where('employee_id', '=', $request->employee_id)->where('leave_type_id', $leave_type->id)->where('status', 'Pending')->whereBetween('created_at', [$date['start_date'],$date['end_date']])->sum('total_leave_days');
                }

                $total_leave_days = !empty($startDate->diff($endDate)) ? $startDate->diff($endDate)->days : 0;

                $return = $leave_type->days - $leaves_used;
                if ($total_leave_days > $return) {
                    return redirect()->back()->with('error', __('You are not eligible for leave.'));
                }

                if (!empty($leaves_pending) && $leaves_pending + $total_leave_days > $return) {
                    return redirect()->back()->with('error', __('Multiple leave entry is pending.'));
                }

                if ($leave_type->days >= $total_leave_days) {
                    if (\Auth::user()->type == 'employee') {
                        $leave->employee_id = $employee->id;
                    } else {
                        $leave->employee_id      = $request->employee_id;
                    }
                    $leave->leave_type_id    = $request->leave_type_id;
                    $leave->start_date       = $request->start_date;
                    $leave->end_date         = $request->end_date;
                    $leave->total_leave_days = $total_leave_days;
                    $leave->leave_reason     = $request->leave_reason;
                    $leave->remark           = $request->remark;
                    // $leave->status           = $request->status;

                    $leave->save();

                    return redirect()->route('leave.index')->with('success', __('Leave successfully updated.'));
                } else {
                    return redirect()->back()->with('error', __('Leave type ' . $leave_type->name . ' is provide maximum ' . $leave_type->days . "  days please make sure your selected days is under " . $leave_type->days . ' days.'));
                }
            } else {
                return redirect()->back()->with('error', __('Permission denied.'));
            }
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function destroy(LocalLeave $leave)
    {
        if (\Auth::user()->can('Delete Leave')) {
            if ($leave->created_by == \Auth::user()->creatorId()) {
                $leave->delete();

                return redirect()->route('leave.index')->with('success', __('Leave successfully deleted.'));
            } else {
                return redirect()->back()->with('error', __('Permission denied.'));
            }
        } else {
            return redirect()->back()->with('error', __('Permission denied.'));
        }
    }

    public function export()
    {
        $name = 'leave_' . date('Y-m-d i:h:s');
        $data = Excel::download(new LeaveExport(), $name . '.xlsx');

        return $data;
    }

    public function action($id)
    {
        $leave     = LocalLeave::find($id);
        $employee  = Employee::find($leave->employee_id);
        $leavetype = LeaveType::find($leave->leave_type_id);



        return view('leave.action', compact('employee', 'leavetype', 'leave'));
    }

    public function changeaction(Request $request)
{
    try {
        \Log::info('Change action started for leave_id: ' . $request->leave_id);
        
        $leave = LocalLeave::find($request->leave_id);
        \Log::info('Current leave status: ' . $leave->status);
        \Log::info('New status requested: ' . $request->status);

        $leave->status = $request->status;

        if ($leave->status == 'Approved') {
            \Log::info('Leave approved, starting certificate generation process');
            
            $startDate = new \DateTime($leave->start_date);
            $endDate = new \DateTime($leave->end_date);
            $endDate->add(new \DateInterval('P1D'));
            $total_leave_days = !empty($startDate->diff($endDate)) ? $startDate->diff($endDate)->days : 0;
            $leave->total_leave_days = $total_leave_days;
            
            // Get employee details for certificate
            $employee = Employee::with('designation', 'department')->find($leave->employee_id);
            \Log::info('Employee details retrieved: ', ['employee_id' => $employee->id, 'name' => $employee->name]);
            
            $leave_type = LeaveType::find($leave->leave_type_id);
            \Log::info('Leave type retrieved: ', ['leave_type_id' => $leave_type->id, 'title' => $leave_type->title]);
            
            // Add certificate-related attributes
            $leave->employee_title = $employee->gender == 'M' ? 'M.' : 'Mme';
            $leave->employee_name = $employee->name;
            $leave->employee_id_number = $employee->employee_id;
            $leave->employee_position = $employee->designation->name ?? $employee->position;
            $leave->employee_department = $employee->department->name ?? '';
            $leave->leave_type_name = $leave_type->title;
            $leave->year = date('Y');

            // Generate the certificate
            try {
                \Log::info('Starting certificate generation');
                $certificateService = app(LeaveCertificateService::class);
                $certificateFilename = $certificateService->generateCertificate($leave);
                \Log::info('Certificate generated: ' . $certificateFilename);
                
                $leave->certificate_path = $certificateFilename;
                \Log::info('Certificate path saved to leave record');
            } catch (\Exception $e) {
                \Log::error('Certificate generation failed: ' . $e->getMessage());
                \Log::error($e->getTraceAsString());
            }
        }

        $leave->save();
        \Log::info('Leave record saved successfully');

    // twilio
    $setting = Utility::settings(\Auth::user()->creatorId());
    $emp = Employee::find($leave->employee_id);
    if (isset($setting['twilio_leave_approve_notification']) && $setting['twilio_leave_approve_notification'] == 1) {
        $uArr = [
            'leave_status' => $leave->status,
        ];
        Utility::send_twilio_msg($emp->phone, 'leave_approve_reject', $uArr);
    }

    $setings = Utility::settings();

    if ($setings['leave_status'] == 1) {
        $employee = Employee::where('id', $leave->employee_id)
            ->where('created_by', '=', \Auth::user()->creatorId())
            ->first();

        $uArr = [
            'leave_email' => $employee->email,
            'leave_status_name' => $employee->name,
            'leave_status' => $request->status,
            'leave_reason' => $leave->leave_reason,
            'leave_start_date' => $leave->start_date,
            'leave_end_date' => $leave->end_date,
            'total_leave_days' => $leave->total_leave_days,
        ];

        // Add certificate download link if leave was approved
        if ($leave->status == 'Approved' && $leave->certificate_path) {
            $certificateUrl = Storage::disk('public')->url('certificates/' . $leave->certificate_path);
            $uArr['certificate_link'] = $certificateUrl;
        }

        $resp = Utility::sendEmailTemplate('leave_status', [$employee->email], $uArr);
        return redirect()->route('leave.index')->with('success', __('Leave status successfully updated.') . 
            ((!empty($resp) && $resp['is_success'] == false && !empty($resp['error'])) ? 
            '<br> <span class="text-danger">' . $resp['error'] . '</span>' : ''));
    }

    return redirect()->route('leave.index')->with('success', __('Leave status successfully updated.'));
} catch (\Exception $e) {
    \Log::error('Error in changeaction: ' . $e->getMessage());
    \Log::error($e->getTraceAsString());
    return redirect()->route('leave.index')->with('error', __('An error occurred while updating leave status.'));
}
}

public function downloadCertificate($leaveId)
{
    $leave = LocalLeave::findOrFail($leaveId);
    
    // Check if user has permission to download
    if (!\Auth::user()->can('Manage Leave') && 
        \Auth::user()->id != $leave->employee()->first()->user_id) {
        return redirect()->back()->with('error', __('Permission denied.'));
    }

    // Check if certificate exists
    if (!$leave->certificate_path || 
        !Storage::disk('public')->exists('certificates/' . $leave->certificate_path)) {
        return redirect()->back()->with('error', __('Certificate not found.'));
    }

    return Storage::disk('public')->download(
        'certificates/' . $leave->certificate_path,
        'leave_certificate_' . $leave->employee_name . '.pdf'
    );
}

    public function jsoncount(Request $request)
    {
        $date = Utility::AnnualLeaveCycle();
        $leave_counts = LeaveType::select(\DB::raw('COALESCE(SUM(leaves.total_leave_days),0) AS total_leave, leave_types.title, leave_types.days,leave_types.id'))
            ->leftjoin(
                'leaves',
                function ($join) use ($request, $date) {
                    $join->on('leaves.leave_type_id', '=', 'leave_types.id');
                    $join->where('leaves.employee_id', '=', $request->employee_id);
                    $join->where('leaves.status', '=', 'Approved');
                    $join->whereBetween('leaves.created_at', [$date['start_date'],$date['end_date']]);
                }
            )->where('leave_types.created_by', '=', \Auth::user()->creatorId())->groupBy('leave_types.id')->get();
        return $leave_counts;
    }

    public function calender(Request $request)
    {
        $created_by = \Auth::user()->creatorId();
        $Meetings = LocalLeave::where('created_by', $created_by)->get();

        $today_date = date('m');
        $current_month_event = LocalLeave::select('id', 'start_date', 'employee_id', 'created_at')->whereRaw('MONTH(start_date)=' . $today_date)->get();

        $arrMeeting = [];

        foreach ($Meetings as $meeting) {
            $arr['id']        = $meeting['id'];
            $arr['employee_id']     = $meeting['employee_id'];
            // $arr['leave_type_id']     = date('Y-m-d', strtotime($meeting['start_date']));
        }

        $leaves = LocalLeave::where('created_by', '=', \Auth::user()->creatorId())->get();
        if (\Auth::user()->type == 'employee') {
            $user     = \Auth::user();
            $employee = Employee::where('user_id', '=', $user->id)->first();
            $leaves   = LocalLeave::where('employee_id', '=', $employee->id)->get();
        } else {
            $leaves = LocalLeave::where('created_by', '=', \Auth::user()->creatorId())->get();
        }

        return view('leave.calender', compact('leaves'));
    }

    public function get_leave_data(Request $request)
    {
        $arrayJson = [];
        if ($request->get('calender_type') == 'google_calender') {
            $type = 'leave';
            $arrayJson =  Utility::getCalendarData($type);
        } else {
            $data = LocalLeave::where('created_by', \Auth::user()->creatorId())->get();

            foreach ($data as $val) {
                $end_date = date_create($val->end_date);
                date_add($end_date, date_interval_create_from_date_string("1 days"));
                $arrayJson[] = [
                    "id" => $val->id,
                    "title" => !empty(\Auth::user()->getLeaveType($val->leave_type_id)) ? \Auth::user()->getLeaveType($val->leave_type_id)->title : '',
                    "start" => $val->start_date,
                    "end" => date_format($end_date, "Y-m-d H:i:s"),
                    "className" => $val->color,
                    "textColor" => '#FFF',
                    "allDay" => true,
                    "url" => route('leave.action', $val['id']),
                ];
            }
        }

        return $arrayJson;
    }
}
