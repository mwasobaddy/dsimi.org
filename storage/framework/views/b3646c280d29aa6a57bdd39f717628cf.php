<?php $__env->startSection('page-title'); ?>
    <?php echo e(__('Create Employee')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('breadcrumb'); ?>
    <li class="breadcrumb-item"><a href="<?php echo e(route('dashboard')); ?>"><?php echo e(__('Home')); ?></a></li>
    <li class="breadcrumb-item"><a href="<?php echo e(url('employee')); ?>"><?php echo e(__('Employee')); ?></a></li>
    <li class="breadcrumb-item"><?php echo e(__('Create Employee')); ?></li>
<?php $__env->stopSection(); ?>



<?php $__env->startSection('content'); ?>
    <style>
        .cursor-pointer {
            cursor: pointer;
        }
    </style>

    <div class="row">
        <div class="">
            <div class="">
                <div class="row">

                </div>
                <?php echo e(Form::open(['route' => ['employee.store'], 'method' => 'post', 'enctype' => 'multipart/form-data'])); ?>

                <div class="row">
                    <div class="col-md-6">
                        <div class="card em-card">
                            <div class="card-header">
                                <h5><?php echo e(__('Personal Detail')); ?></h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <?php echo Form::label('registration_number', __('Matricule'), ['class' => 'form-label']); ?><span class="text-danger pl-1">*</span>
                                        <?php echo Form::text('registration_number', old('registration_number'), [
                                            'class' => 'form-control',
                                            'required' => 'required',
                                            'placeholder' => 'Entrer le numéro de matricule',
                                        ]); ?>

                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                        <?php echo Form::label('first_name', __('First Name'), ['class' => 'form-label']); ?><span class="text-danger pl-1">*</span>
                                        <?php echo Form::text('first_name', old('first_name'), [
                                            'class' => 'form-control',
                                            'required' => 'required',
                                            'placeholder' => 'Entrer le prénom',
                                        ]); ?>

                                    </div>
                                    <div class="form-group col-md-6">
                                        <?php echo Form::label('last_name', __('Last Name'), ['class' => 'form-label']); ?><span class="text-danger pl-1">*</span>
                                        <?php echo Form::text('last_name', old('last_name'), [
                                            'class' => 'form-control',
                                            'required' => 'required',
                                            'placeholder' => 'Entrer le nom',
                                        ]); ?>

                                    </div>
                                    <div class="form-group col-md-6">
                                        <?php echo Form::label('phone', __('Phone'), ['class' => 'form-label']); ?><span class="text-danger pl-1">*</span>
                                        <?php echo Form::text('phone', old('phone'), ['class' => 'form-control', 'placeholder' => 'Entrer le numéro de téléphone']); ?>

                                    </div>
                                    <div class="form-group">
                                        <?php echo Form::label('civil_service_doe', __('Date d’entrée à la Fonction Publique'), ['class' => 'form-label']); ?>

                                        <?php echo e(Form::date('civil_service_doe', null, [
                                            'class' => 'form-control current_date', 
                                            'required' => 'required', 
                                            'autocomplete' => 'off', 
                                            'placeholder' => 'Select date of ent ry into the civil service'
                                        ])); ?>

                                    </div>
                                    <div class="form-group">
                                        <?php echo Form::label('dsimi_doe', __('Date d’entrée à la DSIMI'), ['class' => 'form-label']); ?>

                                        <?php echo e(Form::date('dsimi_doe', null, [
                                            'class' => 'form-control current_date', 
                                            'required' => 'required', 
                                            'autocomplete' => 'off', 
                                            'placeholder' => 'Select date of entry into DSIMI'
                                        ])); ?>

                                    </div>
                                    <div class="form-group col-md-6">
                                        <?php echo e(Form::label('contract_type', __('Nature du Contrat*'), ['class' => 'form-label'])); ?>

                                        <div class="form-icon-user">
                                            <?php echo e(Form::select('contract_type', ['Fonctionnaire' => 'Fonctionnaire'], null, [
                                                'class' => 'form-control contract_type', 
                                                'required' => 'required', 
                                                'placeholder' => 'Sélectionner la nature du Contrat',
                                                'id' => 'contract_type'
                                            ])); ?>

                                        </div>
                                    </div>
                                    
                                    
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <?php echo Form::label('dob', __('Date of Birth'), ['class' => 'form-label']); ?><span class="text-danger pl-1">*</span>
                                            <?php echo e(Form::date('dob', null, ['class' => 'form-control current_date', 'required' => 'required', 'autocomplete' => 'off', 'placeholder' => 'Select Date of Birth'])); ?>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <?php echo Form::label('gender', __('Gender'), ['class' => 'form-label']); ?><span class="text-danger pl-1">*</span>
                                            <div class="d-flex radio-check">
                                                <div class="custom-control custom-radio custom-control-inline">
                                                    <input type="radio" id="g_male" value="Male" name="gender"
                                                        class="form-check-input">
                                                    <label class="form-check-label "
                                                        for="g_male"><?php echo e(__('Masculin')); ?></label>
                                                </div>
                                                <div class="custom-control custom-radio ms-1 custom-control-inline">
                                                    <input type="radio" id="g_female" value="Female" name="gender"
                                                        class="form-check-input">
                                                    <label class="form-check-label "
                                                        for="g_female"><?php echo e(__('Féminin')); ?></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <?php echo Form::label('title', __('Civilité'), ['class' => 'form-label']); ?><span class="text-danger pl-1">*</span>
                                        <div class="form-icon-user">
                                            <?php echo Form::select('title', [
                                                'Docteur' => 'Docteur',
                                                'Madame' => 'Madame',
                                                'Mademoiselle' => 'Mademoiselle',
                                                'Monsieur' => 'Monsieur',
                                            ], null, [  
                                                'class' => 'form-control',
                                                'required' => 'required',
                                                'placeholder' => 'Choisissez la Civilité',
                                            ]); ?>

                                        </div>
                                    </div>
                                    
                                    
                                    <div class="form-group col-md-6">
                                        <?php echo Form::label('email', __('Email'), ['class' => 'form-label']); ?><span class="text-danger pl-1">*</span>
                                        <?php echo Form::email('email', old('email'), [
                                            'class' => 'form-control',
                                            'required' => 'required',
                                            'placeholder' => 'Entrez votre courrier électronique',
                                        ]); ?>

                                    </div>
                                    <div class="form-group col-md-6">
                                        <?php echo Form::label('password', __('Password'), ['class' => 'form-label']); ?><span class="text-danger pl-1">*</span>
                                        <?php echo Form::password('password', [
                                            'class' => 'form-control',
                                            'required' => 'required',
                                            'placeholder' => 'Entrer votre mot de passe',
                                        ]); ?>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <?php echo Form::label('address', __('Address'), ['class' => 'form-label']); ?><span class="text-danger pl-1">*</span>
                                    <?php echo Form::textarea('address', old('address'), [
                                        'class' => 'form-control',
                                        'rows' => 3,
                                        'placeholder' => 'Entrer votre addresse',
                                    ]); ?>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card em-card">
                            <div class="card-header">
                                <h5><?php echo e(__('Company Detail')); ?></h5>
                            </div>
                            <div class="card-body employee-detail-create-body">
                                <div class="row">
                                    <?php echo csrf_field(); ?>
                                    <div class="form-group ">
                                        
                                        <?php echo Form::hidden('employee_id', $employeesId, ['class' => 'form-control', 'disabled' => 'disabled']); ?>

                                    </div>

                                    <div class="form-group col-md-6">
                                        <?php echo e(Form::label('branch_id', __('Select Branch*'), ['class' => 'form-label'])); ?>

                                        <div class="form-icon-user">
                                            <?php echo e(Form::select('branch_id', $branches, null, ['class' => 'form-control branch_id', 'required' => 'required', 'placeholder' => 'Sélectionner une direction', 'id' => 'branch_id', 'required' => 'required'])); ?>

                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <?php echo e(Form::label('department_id', __('Select Department*'), ['class' => 'form-label'])); ?>

                                        <div class="form-icon-user department_div">
                                            <?php echo e(Form::select('department_id', $departments, null, ['class' => 'form-control select2 department_id', 'id' => 'department_id', 'required' => 'required', 'placeholder' => 'Sélectionner la sous direction'])); ?>

                                        </div>

                                        

                                    </div>

                                    <!-- <div class="form-group col-md-6">
                                        <?php echo e(Form::label('designation_id', __('Sélectionner un département'), ['class' => 'form-label'])); ?>

                                        <div class="form-icon-user designation_div">
                                            <?php echo e(Form::select('designation_id', $designations, null, ['class' => 'form-control', 'id' => 'designation_id', 'placeholder' => 'Sélectionner un département'])); ?>

                                        </div>
                                    </div> -->
                                    

                                    <div class="form-group">
                                        <?php echo e(Form::label('services', __('Services'), ['class' => 'form-label'])); ?>

                                        <div class="form-icon-user">
                                            <?php echo e(Form::select('services', [
                                                'Promotion des la qualité de l\'accueil et des soins infirmiers A3' => 'Promotion des la qualité de l\'accueil et des soins infirmiers A3',
                                                'Secrétariat' => 'Secrétariat',
                                                'Organisation et du contrôle des prestations de soins obstétricaux maternels dans le public et le privée' => 'Organisation et du contrôle des prestations de soins obstétricaux maternels dans le public et le privée',
                                                'Communication' => 'Communication',
                                                'Suivi et évaluation' => 'Suivi et évaluation',
                                                'Administratif et financier' => 'Administratif et financier',
                                            ], null, [
                                                'class' => 'form-control services', 
                                                 
                                                'placeholder' => 'Sélectionner un service',
                                                'id' => 'services'
                                            ])); ?>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <?php echo e(Form::label('job', __('Emploi*'), ['class' => 'form-label'])); ?>

                                        <div class="form-icon-user">
                                            <?php echo e(Form::select('job', [
                                                'Administrateur des services financiers' => 'Administrateur des services financiers',
                                                'Médecin Principal' => 'Médecin Principal',
                                                'Infirmière spécialiste' => 'Infirmière spécialiste',
                                                'Secrétaire de direction' => 'Secrétaire de direction',
                                                'Secrétaire administratif' => 'Secrétaire administratif',
                                                'Surveillante d\'unités de Soins' => 'Surveillante d\'unités de Soins',
                                                'Infirmier spécialiste surveillant d\'unité de soins' => 'Infirmier spécialiste surveillant d\'unité de soins',
                                                'Technicien Supérieur de la Communication' => 'Technicien Supérieur de la Communication',
                                                'Inspecteur de soins' => 'Inspecteur de soins',
                                                'Adjoint administratif' => 'Adjoint administratif',
                                                'Ingenieur des services de santé' => 'Ingenieur des services de santé',
                                                'Assistant comptable' => 'Assistant comptable',
                                                'Attaché des Finances' => 'Attaché des Finances',
                                                'Ingénieure des Techniques sanitaires option Santé publique' => 'Ingénieure des Techniques sanitaires option Santé publique',
                                            ], null, [
                                                'class' => 'form-control job', 
                                                'required' => 'required', 
                                                'placeholder' => 'Sélectionner un Emploi',
                                                'id' => 'job'
                                            ])); ?>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <?php echo e(Form::label('position', __('Fonction*'), ['class' => 'form-label'])); ?>

                                        <div class="form-icon-user">
                                            <?php echo e(Form::select('position', [
                                                'Directeur' => 'Directeur',
                                                'Sous-Directeur' => 'Sous-Directeur',
                                                'Infirmier(e) Diplômé(e) d\'Etat',
                                                'Secrétaire' => 'Secrétaire',
                                                'Assistant du chef de service' => 'Assistant du chef de service',
                                                'Chef de service' => 'Chef de service',
                                                'Adjoint administratif' => 'Adjoint administratif',
                                                'Adjoint chef de service financier' => 'Adjoint chef de service financier',
                                            ], null, [
                                                'class' => 'form-control position', 
                                                'required' => 'required', 
                                                'placeholder' => 'Sélectionner une Fonction',
                                                'id' => 'position'
                                            ])); ?>

                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <?php echo e(Form::label('grade', __('Grade*'), ['class' => 'form-label'])); ?>

                                        <div class="form-icon-user">
                                            <?php echo e(Form::select('grade', [
                                                'A3' => 'A3',
                                                'A4' => 'A4',
                                                'A5' => 'A5',
                                                'A6' => 'A6',
                                                'B' => 'B',
                                                'B3' => 'B3',
                                                'C1' => 'C1'
                                            ], null, [
                                                'class' => 'form-control grade', 
                                                'required' => 'required', 
                                                'placeholder' => 'Sélectionner un grade',
                                                'id' => 'grade'
                                            ])); ?>

                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <?php echo Form::label('supervisor_n1', __('Responsable Hiérarchique N+1*'), ['class' => 'form-label']); ?>

                                        <?php echo Form::text('supervisor_n1', old('supervisor_n1'), [
                                            'class' => 'form-control',
                                            'required' => 'required',
                                            'placeholder' => 'Entrer le Responsable Hiérarchique N+1',
                                        ]); ?>

                                    </div>
                                    <div class="form-group col-md-6">
                                        <?php echo Form::label('supervisor_n2', __('Responsable Hiérarchique N+2'), ['class' => 'form-label']); ?>

                                        <?php echo Form::text('supervisor_n2', old('supervisor_n2'), [
                                            'class' => 'form-control',
                                            
                                            'placeholder' => 'Entrer le Responsable Hiérarchique N+2',
                                        ]); ?>

                                    </div>
                                    <div class="form-group col-md-6">
                                        <?php echo e(Form::label('role', __('Rôle*'), ['class' => 'form-label'])); ?>

                                        <div class="form-icon-user">
                                            <?php echo e(Form::select('role', [
                                                'Agent (Employee)' => 'Agent (Employee)',
                                                'Line Manager (Employee)' => 'Line Manager (Employee)',
                                                'Administrator (Employee)' => 'Administrator (Employee)',
                                            ], null, [
                                                'class' => 'form-control role', 
                                                'required' => 'required', 
                                                'placeholder' => 'Sélectionner un Rôle',
                                                'id' => 'role'
                                            ])); ?>

                                        </div>
                                    </div>
                                    
                                    
                                    
                                    
                                    </---> 
                                    <!-- Employee code
                                    
                                    <div class="form-group col-md-6">
                                        <?php echo Form::label('biometric_emp_id', __('Employee Code'), ['class' => 'form-label']); ?>

                                        <?php echo Form::text('biometric_emp_id', old('biometric_emp_id'), [
                                            'class' => 'form-control',
                                            'placeholder' => 'Enter Employee Code',
                                        
                                        ]); ?>

                                    </div>
                                    --->
                                   <!-- <div class="form-group">
                                        <?php echo Form::label('company_doj', __('Company Date Of Joining'), ['class' => '  form-label']); ?>

                                        <?php echo e(Form::date('company_doj', null, ['class' => 'form-control current_date', 'required' => 'required', 'autocomplete' => 'off', 'placeholder' => 'Select company date of joining'])); ?>

                                    </div>
                                    <div class="form-group">
                                        <?php echo Form::label('company_doj2', __('Company Date Of Joining'), ['class' => '  form2-label']); ?>

                                        <?php echo e(Form::date('company_doj2', null, ['class' => 'form-control current_date', 'required' => 'required', 'autocomplete' => 'off', 'placeholder' => 'Select company date of joining'])); ?>

                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    
                    
                </div>

            </div>

            <div class="float-end">
                <button type="submit" class="btn  btn-primary"><?php echo e('Créer'); ?></button>
            </div>
            </form>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script-page'); ?>
    <script>
        $('input[type="file"]').change(function(e) {
            var file = e.target.files[0].name;
            var file_name = $(this).attr('data-filename');
            $('.' + file_name).append(file);
        });
    </script>
    <script>
        $(document).ready(function() {
            var b_id = $('#branch_id').val();
            // getDepartment(b_id);
        });
        $(document).on('change', 'select[name=branch_id]', function() {
            var branch_id = $(this).val();

            getDepartment(branch_id);
        });

    </script>

    <script>
        $(document).ready(function() {
            var now = new Date();
            var month = (now.getMonth() + 1);
            var day = now.getDate();
            if (month < 10) month = "0" + month;
            if (day < 10) day = "0" + day;
            var today = now.getFullYear() + '-' + month + '-' + day;
            $('.current_date').val(today);
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/earljoe/Documents/freelance/Assignment 1/segmented/dsimi.org (copy)/resources/views/employee/create.blade.php ENDPATH**/ ?>