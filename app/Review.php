<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    //
    protected $table='reviews';

    protected $fillable = [
        'customer',
        'review',
        'star'
    ];

    public function Product(){
        return $this->belongsTo(Product::class);
    }
}
