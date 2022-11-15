<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class AdsSpaceManagements extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ads_space_managements', function (Blueprint $table) {
            $table->id();
            $table->string('name', 255);
            $table->integer('price_per_hour');
            $table->string('image_label', 255);
            $table->integer('is_banner')->default(0);
            $table->integer('image_limit')->default(1);
            $table->string('status', 60)->default('published');
            $table->timestamps();
        });
        DB::table('ads_space_managements')->insert([
            'name' => 'Header Image',
            'price_per_hour' => 300,
            'image_label' => '',
            'is_banner' => 1,
            'image_limit' => 5
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ads_space_managements');
    }
}
