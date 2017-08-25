<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrbit extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create(
            'orbit',
            function (Blueprint $table) {
                $table->increments('id');
                $table->date('orbit_determination_date');
                $table->string('orbit_id');
                $table->string('name');
                $table->float('speed');
                $table->boolean('hazardous');
            }
        );
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orbit');
    }
}
