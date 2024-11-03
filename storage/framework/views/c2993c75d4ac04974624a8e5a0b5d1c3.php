<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Manage Hourly Permissions')); ?>

<?php $__env->stopSection(); ?>


<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Hourly Permissions')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>       
        <a href="#" data-url="<?php echo e(route('hpermissions.create')); ?>" data-ajax-popup="true" data-size="lg"
        data-title="<?php echo e(__('Create New Permission')); ?>" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-primary"
        data-bs-original-title="<?php echo e(__('Create')); ?>">
        <i class="ti ti-plus"></i>
    </a>
<?php $__env->stopSection(); ?>


<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5><?php echo e(__('Hourly Permissions List')); ?></h5>
                </div>
                <div class="card-body">
                    <?php if($permissions->isEmpty()): ?>
                        <div class="alert alert-warning">
                            <?php echo e(__('No permission requests found.')); ?>

                        </div>
                    <?php else: ?>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th><?php echo e(__('ID')); ?></th>
                                    <th><?php echo e(__('User ID')); ?></th>
                                    <th><?php echo e(__('Request Date')); ?></th>
                                    <th><?php echo e(__('Start Time')); ?></th>
                                    <th><?php echo e(__('End Time')); ?></th>
                                    <th><?php echo e(__('Status')); ?></th>
                                    <th><?php echo e(__('Reason')); ?></th>
                                    <th><?php echo e(__('Certificate')); ?></th>
                                    
                                    <?php if(\Auth::user()->type != 'employee'): ?>
                                        <th><?php echo e(__('Actions')); ?></th>
                                    <?php endif; ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__currentLoopData = $permissions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $permission): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e($permission->id); ?></td>
                                        <td><?php echo e($permission->user_id); ?></td>
                                        <td><?php echo e($permission->request_date); ?></td>
                                        <td><?php echo e($permission->start_time); ?></td>
                                        <td><?php echo e($permission->end_time); ?></td>
                                        <td><?php echo e($permission->status); ?></td>
                                        <td><?php echo e($permission->reason); ?></td>
                                        <td>
                                            <?php if($permission->status == 'approved' && $permission->certificate_path): ?>
                                                <a href="<?php echo e(route('hpermission.certificate.download', $permission->id)); ?>" 
                                                class="btn btn-sm btn-primary">
                                                    <i class="ti ti-download"></i> 
                                                    <?php echo e(__('Download Certificate')); ?>

                                                </a>
                                            <?php else: ?>
                                                <div class="badge bg-secondary p-2 px-3 rounded">
                                                    <?php echo e(__('Not Available')); ?>

                                                </div>
                                            <?php endif; ?>
                                        </td>
                                            
                                        <td class="Action">
                                            <span>
                                                <?php if(\Auth::user()->type != 'employee'): ?>

                                                    <div class="action-btn bg-success ms-2">
                                                        <a href="#" class="mx-3 btn btn-sm  align-items-center"
                                                            data-size="lg"
                                                            data-url="<?php echo e(URL::to('hpermissions/' . $permission->id)); ?>"
                                                            data-ajax-popup="true" data-size="md" data-bs-toggle="tooltip"
                                                            title="" data-title="<?php echo e(__('Leave Action')); ?>"
                                                            data-bs-original-title="<?php echo e(__('Manage Leave')); ?>">
                                                            <i class="ti ti-caret-right text-white"></i>
                                                        </a>
                                                    </div>

                                                <?php endif; ?>
                                            </span>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/earljoe/Documents/freelance/Assignment 1/segmented/updated/dsimi.org/resources/views/hpermissions/index.blade.php ENDPATH**/ ?>