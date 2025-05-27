<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class branmodel extends Model
{
    protected $table = 'brand';

    protected $fillable = [
        'brand',
    ];

    public function cars(){
        return $this->hasMany(carsmodel::class);
    }
}
