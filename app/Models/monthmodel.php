<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class monthmodel extends Model
{
    protected $table = 'available_months';

    protected $fillable = [
        'installment_id',
        'month',
        'description',
    ];

    public function available(){
        return $this->belongsTo(carsmodel::class);
    }
}
