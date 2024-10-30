<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::create('hpermissions', function (Blueprint $table) {
        $table->id();
        $table->foreignId('id')->constrained()->onDelete('cascade');
        $table->date('request_date');
        $table->time('start_time');
        $table->time('end_time');
        $table->string('status')->default('pending'); // pending, approved, rejected
        $table->text('reason')->nullable();
        $table->timestamps();
    });
}

public function down()
{
    Schema::dropIfExists('hpermissions');
}
};
