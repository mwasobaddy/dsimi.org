<form action="<?php echo e(route('hpermissions.store')); ?>" method="POST">
    <?php echo csrf_field(); ?>
    <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="request_date">Request Date:</label>
                    <input type="date" name="request_date" id="request_date" class="form-control" required>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label for="start_time">Start Time:</label>
                    <input type="time" name="start_time" id="start_time" class="form-control" required>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label for="end_time">End Time:</label>
                    <input type="time" name="end_time" id="end_time" class="form-control" required>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label for="reason">Reason (optional):</label>
                    <textarea name="reason" id="reason" class="form-control"></textarea>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-light" data-bs-dismiss="modal"><?php echo e(__('Close')); ?></button>
        <input type="submit" value="<?php echo e(__('Create')); ?>" class="btn btn-primary">
    </div>
</form>
<?php /**PATH C:\XAMPP\htdocs\hrnew\dsimi.org\resources\views/hpermissions/create.blade.php ENDPATH**/ ?>