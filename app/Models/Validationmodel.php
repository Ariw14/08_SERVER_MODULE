<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Validationmodel extends Model
{
    protected $table = 'validations';

    protected $fillable = [
        'society_id',
        'validator_id',
        'status',
        'job',
        'job_description',
        'income',
        'reason_accepted',
        'validator_notes',
    ];

    public function society(){
        return $this->belongsTo(societiesModel::class);
    }
}
