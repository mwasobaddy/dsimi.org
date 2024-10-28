@extends('layouts.admin')

@section('page-title')
    {{ __('Mes Collaborateurs') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item">{{ __('Mes Collaborateurs') }}</li>
@endsection

@section('action-button')
    @can('Create Employee')
        <a href="{{ route('employee.create') }}" data-title="{{ __('Create New Employee') }}" data-bs-toggle="tooltip"
            title="" class="btn btn-sm btn-primary" data-bs-original-title="{{ __('Create') }}">
            <i class="ti ti-plus"></i>
        </a>
    @endcan
@endsection

@section('content')
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header card-body table-border-style">
                    <div class="table-responsive">
                        <table class="table" id="pc-dt-simple">
                            <thead>
                                <tr>
                                    <th>{{ __('Matricule') }}</th>
                                    <th>{{ __('Prénom') }}</th>
                                    <th>{{ __('Nom de Famille') }}</th>
                                    <th>{{ __('Genre') }}</th>
                                    <th>{{ __('Email') }}</th>
                                    <th>{{ __("Date d'entrée à la Fonction Publique") }}</th>
                                    <th>{{ __("Date d'entrée à la DSIMI") }}</th>
                                    <th>{{ __('Emploi') }}</th>
                                    <th>{{ __('Fonction') }}</th>
                                    <th>{{ __('Niveau de supervision') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $currentEmployee = App\Models\Employee::where('user_id', Auth::user()->id)->first();
                                    $employees = App\Models\Employee::where('supervisor_n1', $currentEmployee->name)
                                        ->orWhere('supervisor_n2', $currentEmployee->name)
                                        ->get();
                                @endphp

                                @foreach ($employees as $employee)
                                    <tr>
                                        <td>{{ $employee->registration_number }}</td>
                                        <td>{{ $employee->first_name }}</td>
                                        <td>{{ $employee->last_name }}</td>
                                        <td>{{ $employee->gender ? ($employee->gender=='Male' ? 'Masculin' : 'Féminin'): '' }}</td>
                                        <td>{{ $employee->email }}</td>
                                        <td>
                                            {{ \Carbon\Carbon::parse($employee->civil_service_doe)->locale('fr')->isoFormat('LL') }}
                                        </td>
                                        <td>
                                            {{ \Carbon\Carbon::parse($employee->dsimi_doe)->locale('fr')->isoFormat('LL') }}
                                        </td>
                                        <td>{{ $employee->job }}</td>
                                        <td>{{ $employee->position }}</td>
                                        <td>
                                            @if($employee->supervisor_n1 == $currentEmployee->name)
                                                {{ __('Niveau 1') }}
                                            @elseif($employee->supervisor_n2 == $currentEmployee->name)
                                                {{ __('Niveau 2') }}
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection