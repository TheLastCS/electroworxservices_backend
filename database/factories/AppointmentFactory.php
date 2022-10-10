<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class AppointmentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'appType' => "repair",
            'dateTime' => $this->faker->dateTime(),
            'user_id' => $this->faker->numberBetween(1,10),
            'deleted_at' => null,
            'created_at' => now(),
            'updated_at' => null,
        ];
    }
}
