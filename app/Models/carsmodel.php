<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class carsmodel extends Model
{
    protected $table = 'installment';

    protected $fillable = [
        'brand_id',
        'cars',
        'description',
        'price',
    ];

    public function brand(){
        return $this->belongsTo(branmodel::class,);
    }

    public function month(){
        return $this->hasMany(monthmodel::class);
    }
}
