<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;

class ViewUsers extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'view:users';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Display all users with all attributes from the database';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $users = User::all();  // Fetch all users

        if ($users->isEmpty()) {
            $this->info('No users found.');
        } else {
            // Get the keys of the first user's attributes to use as table headers
            $headers = array_keys($users->first()->getAttributes());

            // Convert the users' attributes to arrays for table display
            $data = $users->map(function ($user) {
                return $user->getAttributes();  // Get all attributes for each user
            })->toArray();

            // Display the table
            $this->table($headers, $data);
        }

        return 0;
    }
}

