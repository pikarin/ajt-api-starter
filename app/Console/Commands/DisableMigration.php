<?php

namespace App\Console\Commands;

use Illuminate\Database\Console\Migrations\MigrateCommand;

class DisableMigration extends MigrateCommand
{
    /**
     * @inheritdoc
     */
    public function handle()
    {
        if (app()->environment() != 'testing') {
            $this->info('Migration intentionally disabled');

            return 0;
        }

        return parent::handle();
    }
}
