<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Manage Employee')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Employee')); ?></li>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('action-button'); ?>
    <!-- Your action buttons here -->
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
                                <?php if(isset($employee)): ?>
                                    <tr>
                                        <td><?php echo e($employee->registration_number); ?></td>
                                        <td><?php echo e($employee->first_name); ?></td>
                                        <td><?php echo e($employee->last_name); ?></td>
                                        <td><?php echo e($employee->gender ? ($employee->gender=='Male' ? 'Masculin' : 'Féminin'): ''); ?></td>
                                        <td><?php echo e($employee->email); ?></td>
                                        <td><?php echo e(\Carbon\Carbon::parse($employee->civil_service_doe)->locale('fr')->isoFormat('LL')); ?></td>
                                        <td><?php echo e(\Carbon\Carbon::parse($employee->dsimi_doe)->locale('fr')->isoFormat('LL')); ?></td>
                                        <td><?php echo e($employee->job); ?></td>
                                        <td><?php echo e($employee->position); ?></td>
                                        <?php if(Gate::check('Edit Employee') || Gate::check('Delete Employee')): ?>
                                            <td class="Action">
                                                <?php if($employee->user->is_active == 1 && $employee->user->is_disable == 1): ?>
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
                                <?php else: ?>
                                    <tr>
                                        <td colspan="<?php echo e($colspan); ?>"><?php echo e(__('No data available')); ?></td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\dsimi.org\resources\views/employee/show.blade.php ENDPATH**/ ?>