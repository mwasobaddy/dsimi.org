

<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Mes Collaborateurs')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Mes Collaborateurs')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
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
                                    <th><?php echo e(__('Niveau de supervision')); ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $currentEmployee = App\Models\Employee::where('user_id', Auth::user()->id)->first();
                                    $employees = App\Models\Employee::where('supervisor_n1', $currentEmployee->name)
                                        ->orWhere('supervisor_n2', $currentEmployee->name)
                                        ->get();
                                ?>

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
                                        <td>
                                            <?php if($employee->supervisor_n1 == $currentEmployee->name): ?>
                                                <?php echo e(__('Niveau 1')); ?>

                                            <?php elseif($employee->supervisor_n2 == $currentEmployee->name): ?>
                                                <?php echo e(__('Niveau 2')); ?>

                                            <?php endif; ?>
                                        </td>
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
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\dsimi.org\resources\views/employee/show_employee_supervise.blade.php ENDPATH**/ ?>