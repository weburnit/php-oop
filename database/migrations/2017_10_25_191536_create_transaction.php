<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTransaction extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create(
            'transactions_histories',
            function (Blueprint $table) {
                $table->increments('id');
                $table->unsignedInteger('fk_account');
                $table->float('balance');
                $table->text('type');
                $table->timestamps();
                $table->foreign('fk_account')->references('id')->on('accounts')->onDelete('cascade');
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
