<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddIndexToMediaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('media_files', function (Blueprint $table) {
            $table->index(['folder_id', 'user_id', 'created_at'], 'media_files_index');
        });

        Schema::table('media_folders', function (Blueprint $table) {
            $table->index(['parent_id', 'user_id', 'created_at'], 'media_folders_index');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('media_files', function (Blueprint $table) {
            $table->dropIndex('media_files_index');
        });

        Schema::table('media_folders', function (Blueprint $table) {
            $table->dropIndex('media_folders_index');
        });
    }
}
