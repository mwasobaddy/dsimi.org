

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Manage Employee')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Employee')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <a href="<?php echo e(route('employee.export')); ?>" data-bs-toggle="tooltip" data-bs-placement="top"
        data-bs-original-title="<?php echo e(__('Export')); ?>" class="btn btn-sm btn-primary">
        <i class="ti ti-file-export"></i>
    </a>

    <a href="#" data-url="<?php echo e(route('employee.file.import')); ?>" data-ajax-popup="true"
        data-title="<?php echo e(__('Import  Employee CSV File')); ?>" data-bs-toggle="tooltip" title=""
        class="btn btn-sm btn-primary" data-bs-original-title="<?php echo e(__('Import')); ?>">
        <i class="ti ti-file"></i>
    </a>
    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Create Employee')): ?>
        <a href="<?php echo e(route('employee.create')); ?>" data-title="<?php echo e(__('Create New Employee')); ?>" data-bs-toggle="tooltip"
            title="" class="btn btn-sm btn-primary" data-bs-original-title="<?php echo e(__('Create')); ?>">
            <i class="ti ti-plus"></i>
        </a>
    <?php endif; ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header card-body table-border-style">
                    
                    <div class="table-responsive">
                        <table class="table" id="pc-dt-simple">
                            <thead>
                                <tr>
                                  
                                    <th><?php echo e(__('Matricule')); ?></th>
                                    <th><?php echo e(__('Prénom')); ?></th>
                                    <th><?php echo e(__('Nom de Famille')); ?></th>
                                    <th><?php echo e(__('Genre')); ?></th>
                                    <th><?php echo e(__('Email')); ?></th>
                                    <th><?php echo e(__("Date d'entrée à la Fonction Publique")); ?></th>
                                    <th><?php echo e(__("Date d'entrée à la DSIMI")); ?></th>
                                    <th><?php echo e(__('Emploi')); ?></th>
                                    <th><?php echo e(__('Fonction')); ?></th>
                                    <?php if(Gate::check('Edit Employee') || Gate::check('Delete Employee')): ?>
                                        <th width="200px"><?php echo e(__('Action')); ?></th>
                                    <?php endif; ?>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__currentLoopData = $employees; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employee): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        
                                        <td><?php echo e($employee->registration_number); ?></td>
                                        <td><?php echo e($employee->first_name); ?></td>
                                        <td><?php echo e($employee->last_name); ?></td>
                                        <td><?php echo e($employee->gender ? ($employee->gender=='Male' ? 'Masculin' : 'Féminin'): ''); ?></td>
                                        <td><?php echo e($employee->email); ?></td>
                                        <td>
                                            <?php echo e(\Carbon\Carbon::parse($employee->civil_service_doe)->locale('fr')->isoFormat('LL')); ?>

    
                                        </td>
                                        <td>
                                            <?php echo e(\Carbon\Carbon::parse($employee->dsimi_doe)->locale('fr')->isoFormat('LL')); ?>

    
                                        </td>
                                        <td><?php echo e($employee->job); ?></td>
                                        <td><?php echo e($employee->position); ?></td>
                                        
                                        <?php if(Gate::check('Edit Employee') || Gate::check('Delete Employee')): ?>
                                            <td class="Action">
                                                <?php if(!empty($employee->user) && $employee->user->is_active == 1 && $employee->user->is_disable == 1): ?>
                                                    <span>
                                                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Edit Employee')): ?>
                                                            <div class="action-btn bg-info ms-2">
                                                                <a href="<?php echo e(route('employee.edit', \Illuminate\Support\Facades\Crypt::encrypt($employee->id))); ?>"
                                                                    class="mx-3 btn btn-sm  align-items-center"
                                                                    data-bs-toggle="tooltip" title=""
                                                                    data-bs-original-title="<?php echo e(__('Edit')); ?>">
                                                                    <i class="ti ti-pencil text-white"></i>
                                                                </a>
                                                            </div>
                                                        <?php endif; ?>

                                                        <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('Delete Employee')): ?>
                                                            <div class="action-btn bg-danger ms-2">
                                                                <?php echo Form::open([
                                                                    'method' => 'DELETE',
                                                                    'route' => ['employee.destroy', $employee->id],
                                                                    'id' => 'delete-form-' . $employee->id,
                                                                ]); ?>

                                                                <a href="#"
                                                                    class="mx-3 btn btn-sm  align-items-center bs-pass-para"
                                                                    data-bs-toggle="tooltip" title=""
                                                                    data-bs-original-title="Delete" aria-label="Delete"><i
                                                                        class="ti ti-trash text-white text-white"></i></a>
                                                                </form>
                                                            </div>
                                                        <?php endif; ?>

                                                    </span>
                                                <?php else: ?>
                                                    <i class="ti ti-lock"></i>
                                                <?php endif; ?>
                                            </td>
                                        <?php endif; ?>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\dsimi.org\resources\views/employee/index.blade.php ENDPATH**/ ?>