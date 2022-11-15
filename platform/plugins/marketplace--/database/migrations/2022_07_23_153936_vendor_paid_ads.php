<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class VendorPaidAds extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mp_vendor_paid_ads', function (Blueprint $table) {
            $table->id("id");
            $table->integer("customer_id");
            $table->string("name");
            $table->integer("ads_space_id");
            $table->dateTime("start_date");
            $table->dateTime("end_date");
            $table->string("ads_hour");
            $table->integer("total_amount");
            $table->text("link")->default("#");
            $table->text("banner_image");
            $table->string('status', 60)->default('published');
            $table->timestamp("created_at")->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp("updated_at")->default(DB::raw('CURRENT_TIMESTAMP'));
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mp_vendor_paid_ads');
    }
}
