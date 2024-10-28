@extends('layouts.admin')

@section('page-title')
    {{ __('Manage Hourly Permissions') }}
@endsection


@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">{{ __('Home') }}</a></li>
    <li class="breadcrumb-item">{{ __('Hourly Permissions') }}</li>
@endsection

@section('action-button')       
        <a href="#" data-url="{{ route('hpermissions.create') }}" data-ajax-popup="true" data-size="lg"
        data-title="{{ __('Create New Permission') }}" data-bs-toggle="tooltip" title="" class="btn btn-sm btn-primary"
        data-bs-original-title="{{ __('Create') }}">
        <i class="ti ti-plus"></i>
    </a>
@endsection


@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5>{{ __('Hourly Permissions List') }}</h5>
                </div>
                <div class="card-body">
                    @if ($permissions->isEmpty())
                        <div class="alert alert-warning">
                            {{ __('No permission requests found.') }}
                        </div>
                    @else
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>{{ __('ID') }}</th>
                                    <th>{{ __('User ID') }}</th>
                                    <th>{{ __('Request Date') }}</th>
                                    <th>{{ __('Start Time') }}</th>
                                    <th>{{ __('End Time') }}</th>
                                    <th>{{ __('Status') }}</th>
                                    <th>{{ __('Reason') }}</th>
                                    <th>{{ __('Actions') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($permissions as $permission)
                                    <tr>
                                        <td>{{ $permission->id }}</td>
                                        <td>{{ $permission->user_id }}</td>
                                        <td>{{ $permission->request_date }}</td>
                                        <td>{{ $permission->start_time }}</td>
                                        <td>{{ $permission->end_time }}</td>
                                        <td>{{ $permission->status }}</td>
                                        <td>{{ $permission->reason }}</td>
                                        <td>
                                            <!-- Actions like Edit/Delete can go here -->
                                            
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection