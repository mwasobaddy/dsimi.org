<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddCertificateFieldsToLeavesTable extends Migration
{
    public function up()
    {
        Schema::table('leaves', function (Blueprint $table) {
            $table->string('employee_title')->nullable();
            $table->string('employee_name')->nullable();
            $table->string('employee_id_number')->nullable();
            $table->string('employee_position')->nullable();
            $table->string('employee_department')->nullable();
            $table->string('leave_type_name')->nullable();
            $table->year('year')->nullable();
            $table->string('certificate_path')->nullable();
        });
    }

    public function down()
    {
        Schema::table('leaves', function (Blueprint $table) {
            $table->dropColumn([
                'employee_title',
                'employee_name',
                'employee_id_number',
                'employee_position',
                'employee_department',
                'leave_type_name',
                'year',
                'certificate_path'
            ]);
        });
    }
}