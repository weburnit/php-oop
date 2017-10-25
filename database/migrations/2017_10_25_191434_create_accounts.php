<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAccounts extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create(
            'accounts',
            function (Blueprint $table) {
                $table->increments('id');
                $table->unsignedInteger('fk_customer');
                $table->string('balance');
                $table->string('tier');
                $table->timestamps();
                $table->foreign('fk_customer')->references('id')->on('customers')->onDelete('cascade');
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
        //
    }
}
