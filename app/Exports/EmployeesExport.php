<?php

namespace App\Exports;

use App\Models\Branch;
use App\Models\Department;
use App\Models\Designation;
use App\Models\Employee;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class EmployeesExport implements FromCollection, WithHeadings
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return Employee::where('created_by', \Auth::user()->creatorId())
            ->get()
            ->map(function ($employee) {
                return [
                    'registration_number' => $employee->registration_number,
                    'first_name' => $employee->first_name,
                    'last_name' => $employee->last_name,
                    'gender' => $employee->gender ? ($employee->gender == 'Male' ? 'Masculine' : 'Feminin') : '',
                    'email' => $employee->email,
                    'civil_service_doe' => \Carbon\Carbon::parse($employee->civil_service_doe)->locale('fr')->isoFormat('LL'),
                    'dsimi_doe' => \Carbon\Carbon::parse($employee->dsimi_doe)->locale('fr')->isoFormat('LL'),
                    'job' => !empty($employee->job) ? $employee->job : '-',
                    'position' => !empty($employee->position) ? $employee->position : '',
                    'created_by' => Employee::login_user($employee->created_by),
                ];
            });
    }

    public function headings(): array
    {
        return [
            "Matricule",
            "Prénom",
            "Nom de Famille",
            "Genre",
            "Email",
            "Date d'entrée à la Fonction Publique",
            "Date d'entrée à la DSIMI",
            "Emploi",
            "Fonction",
            "Created By"
        ];
    }
}
