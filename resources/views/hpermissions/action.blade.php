{{ Form::open(['url' => 'hpermission/changeaction', 'method' => 'post']) }}
<div class="modal-body">
    <div class="row">
        <div class="col-12">
            <table class="table modal-table" id="pc-dt-simple">
                <tr role="row">
                    <th>{{ __('Employee') }}</th>
                    <td>{{ !empty($employee->name) ? $employee->name : '' }}</td>
                </tr>
                <tr>
                    <th>{{ __('Leave Type ') }}</th>
                    <td>Hourly Leave</td>
                </tr>
                <tr>
                    <th>{{ __('Appplied On') }}</th>
                    <td>{{ \Auth::user()->dateFormat($permission->request_date) }}</td>
                </tr>
                <tr>
                    <th>{{ __('Start Time') }}</th>
                    <td>{{ \Auth::user()->dateFormat($permission->start_time) }}</td>
                </tr>
                <tr>
                    <th>{{ __('End Time') }}</th>
                    <td>{{ \Auth::user()->dateFormat($permission->end_time) }}</td>
                </tr>
                <tr>
                    <th>{{ __('Permission Reason') }}</th>
                    <td>{{ $permission->reason }}</td>
                </tr>
                <tr>
                    <th>{{ __('Status') }}</th>
                    <td>{{ $permission->status }}</td>
                </tr>
            </table>
        </div>
    </div>
</div>
@if (Auth::user()->type == 'company' || Auth::user()->type == 'Line Manager (Employee)' || Auth::user()->type == 'hr' || strtolower(Auth::user()->type) == 'super admin')
    <input type="hidden" name="id" value="{{ $permission->id }}">
    <div class="modal-footer">
        <button type="submit" class="btn btn-success rounded" name="status" value="Approved">{{ __('Approved') }}</button>
        <button type="submit" class="btn btn-danger rounded" name="status" value="Reject">{{ __('Reject') }}</button>
    </div>
@endif
{{ Form::close() }}