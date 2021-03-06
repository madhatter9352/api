<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Review;
use Faker\Generator as Faker;
use App\Product;

$factory->define(Review::class, function (Faker $faker) {
    return [
        //
        'product_id'=>factory(Product::class),
        'customer'=>$faker->name,
        'review'=>$faker->paragraph,
        'star'=>$faker->numberBetween(0,5)
    ];
});
