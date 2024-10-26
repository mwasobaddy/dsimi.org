@extends('layouts.admin')

@section('page-title')
    {{ __('Manage Employee') }}
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item">{{ __('Employee') }}</li>
@endsection

@section('action-button')
    <!-- Your action buttons here -->
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
                                    @if (Gate::check('Edit Employee') || Gate::check('Delete Employee'))
                                        <th width="200px">{{ __('Action') }}</th>
                                    @endif
                                </tr>
                            </thead>
                            <tbody>
                                @if (isset($employee))
                                    <tr>
                                        <td>{{ $employee->registration_number }}</td>
                                        <td>{{ $employee->first_name }}</td>
                                        <td>{{ $employee->last_name }}</td>
                                        <td>{{ $employee->gender ? ($employee->gender=='Male' ? 'Masculin' : 'Féminin'): '' }}</td>
                                        <td>{{ $employee->email }}</td>
                                        <td>{{ \Carbon\Carbon::parse($employee->civil_service_doe)->locale('fr')->isoFormat('LL') }}</td>
                                        <td>{{ \Carbon\Carbon::parse($employee->dsimi_doe)->locale('fr')->isoFormat('LL') }}</td>
                                        <td>{{ $employee->job }}</td>
                                        <td>{{ $employee->position }}</td>
                                        @if (Gate::check('Edit Employee') || Gate::check('Delete Employee'))
                                            <td class="Action">
                                                @if ($employee->user->is_active == 1 && $employee->user->is_disable == 1)
                                                    <span>
                                                        @can('Edit Employee')
                                                            <div class="action-btn bg-info ms-2">
                                                                <a href="{{ route('employee.edit', \Illuminate\Support\Facades\Crypt::encrypt($employee->id)) }}"
                                                                    class="mx-3 btn btn-sm  align-items-center"
                                                                    data-bs-toggle="tooltip" title=""
                                                                    data-bs-original-title="{{ __('Edit') }}">
                                                                    <i class="ti ti-pencil text-white"></i>
                                                                </a>
                                                            </div>
                                                        @endcan
                                                        @can('Delete Employee')
                                                            <div class="action-btn bg-danger ms-2">
                                                                {!! Form::open([
                                                                    'method' => 'DELETE',
                                                                    'route' => ['employee.destroy', $employee->id],
                                                                    'id' => 'delete-form-' . $employee->id,
                                                                ]) !!}
                                                                <a href="#"
                                                                    class="mx-3 btn btn-sm  align-items-center bs-pass-para"
                                                                    data-bs-toggle="tooltip" title=""
                                                                    data-bs-original-title="Delete" aria-label="Delete"><i
                                                                        class="ti ti-trash text-white text-white"></i></a>
                                                                </form>
                                                            </div>
                                                        @endcan
                                                    </span>
                                                @else
                                                    <i class="ti ti-lock"></i>
                                                @endif
                                            </td>
                                        @endif
                                    </tr>
                                @else
                                    <tr>
                                        <td colspan="{{ $colspan }}">{{ __('No data available') }}</td>
                                    </tr>
                                @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

