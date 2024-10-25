@php
    $plan = Utility::getChatGPTSettings();
@endphp

{{ Form::open(['url' => 'goaltracking', 'method' => 'post']) }}
<div class="modal-body">

    @if ($plan->enable_chatgpt == 'on')
    <div class="card-footer text-end">
        <a href="#" class="btn btn-sm btn-primary" data-size="medium" data-ajax-popup-over="true"
            data-url="{{ route('generate', ['goal tracking']) }}" data-bs-toggle="tooltip" data-bs-placement="top"
            title="{{ __('Generate') }}" data-title="{{ __('Generate Content With AI') }}">
            <i class="fas fa-robot"></i>{{ __(' Generate With AI') }}
        </a>
    </div>
    @endif

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                {{ Form::label('branch', __('Direction*'), ['class' => 'col-form-label']) }}
                {{ Form::select('branch', $brances, null, ['class' => 'form-control select2', 'required' => 'required']) }}
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                {{ Form::label('goal_type', __('GoalTypes*'), ['class' => 'col-form-label']) }}
                {{ Form::select('goal_type', $goalTypes, null, ['class' => 'form-control select2', 'required' => 'required']) }}
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                {{ Form::label('start_date', __('Start Date*'), ['class' => 'col-form-label']) }}
                {{ Form::text('start_date', null, ['class' => 'form-control d_week current_date', 'autocomplete' => 'off', 'required' => 'required']) }}
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                {{ Form::label('end_date', __('End Date*'), ['class' => 'col-form-label']) }}
                {{ Form::text('end_date', null, ['class' => 'form-control d_week current_date', 'autocomplete' => 'off', 'required' => 'required']) }}
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                {{ Form::label('subject', __('Objectif'), ['class' => 'col-form-label']) }}
                {{ Form::text('subject', null, ['class' => 'form-control', 'placeholder' => 'Veuillez saisir l’objectif', 'required' => 'required']) }}
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                {{ Form::label('target_achievement', __('Target Achievement'), ['class' => 'col-form-label']) }}
                {{ Form::text('target_achievement', null, ['class' => 'form-control', 'placeholder' => 'Veuillez saisir le but spécifique de l’objectif']) }}
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                {{ Form::label('description', __('Actions à mener pour l’atteinte de l’objectif'), ['class' => 'col-form-label']) }}
                {{ Form::textarea('description', null, ['class' => 'form-control', 'rows' => '3', 'placeholder' => 'Veuillez saisir les actions']) }}
            </div>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                {{ Form::label('description', __('Ressources nécessaires'), ['class' => 'col-form-label']) }}
                {{ Form::textarea('description', null, ['class' => 'form-control', 'rows' => '3', 'placeholder' => 'Veuillez saisr les ressources nécessaires requises pour atteinte de l’objectif']) }}
            </div>
        </div>
    </div>
</div>
<div class="modal-footer">
    <input type="button" value="Cancel" class="btn btn-light" data-bs-dismiss="modal">
    <input type="submit" value="{{ __('Create') }}" class="btn btn-primary">
</div>
{{ Form::close() }}

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
