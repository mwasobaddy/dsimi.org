<?php echo e(Form::open(['url' => 'hpermission/changeaction', 'method' => 'post'])); ?>

<div class="modal-body">
    <div class="row">
        <div class="col-12">
            <table class="table modal-table" id="pc-dt-simple">
                <tr role="row">
                    <th><?php echo e(__('Employee')); ?></th>
                    <td><?php echo e(!empty($employee->name) ? $employee->name : ''); ?></td>
                </tr>
                <tr>
                    <th><?php echo e(__('Leave Type ')); ?></th>
                    <td>Hourly Leave</td>
                </tr>
                <tr>
                    <th><?php echo e(__('Appplied On')); ?></th>
                    <td><?php echo e(\Auth::user()->dateFormat($permission->request_date)); ?></td>
                </tr>
                <tr>
                    <th><?php echo e(__('Start Time')); ?></th>
                    <td><?php echo e(\Auth::user()->dateFormat($permission->start_time)); ?></td>
                </tr>
                <tr>
                    <th><?php echo e(__('End Time')); ?></th>
                    <td><?php echo e(\Auth::user()->dateFormat($permission->end_time)); ?></td>
                </tr>
                <tr>
                    <th><?php echo e(__('Permission Reason')); ?></th>
                    <td><?php echo e($permission->reason); ?></td>
                </tr>
                <tr>
                    <th><?php echo e(__('Status')); ?></th>
                    <td><?php echo e($permission->status); ?></td>
                </tr>
            </table>
        </div>
    </div>
</div>
<?php if(Auth::user()->type == 'company' || Auth::user()->type == 'Line Manager (Employee)' || Auth::user()->type == 'hr' || strtolower(Auth::user()->type) == 'super admin'): ?>
    <input type="hidden" name="id" value="<?php echo e($permission->id); ?>">
    <div class="modal-footer">
        <button type="submit" class="btn btn-success rounded" name="status" value="Approved"><?php echo e(__('Approved')); ?></button>
        <button type="submit" class="btn btn-danger rounded" name="status" value="Reject"><?php echo e(__('Reject')); ?></button>
    </div>
<?php endif; ?>
<?php echo e(Form::close()); ?><?php /**PATH C:\xampp\htdocs\dsimi.org\resources\views/hpermissions/action.blade.php ENDPATH**/ ?>