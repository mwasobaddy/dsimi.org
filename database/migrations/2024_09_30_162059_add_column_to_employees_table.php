<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('employees', function (Blueprint $table) {
            $table->string('registration_number')->nullable();
            $table->string('title')->nullable();
            $table->string('civil_service_doe')->nullable();
            $table->string('dsimi_doe')->nullable();
            $table->string('contract_type')->nullable();
            $table->string('services')->nullable();
            $table->string('job')->nullable();
            $table->string('position')->nullable();
            $table->string('grade')->nullable();
            $table->string('supervisor_n1')->nullable();
            $table->string('supervisor_n2')->nullable();
            $table->string('role')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('employees', function (Blueprint $table) {
            //
        });
    }
};
