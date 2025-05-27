<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class societiesModel extends Authenticatable
{

    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'societies';

    protected $fillable = [
        'id_card_number',
        'password',
        'name',
        'born_date',
        'gender',
        'address',
        'regional_id',
        'login_token',
    ];

    public function regional(){
        return $this->belongsTo(regionalmodel::class);
    }

    public function validation(){
        return $this->hasMany(Validationmodel::class);
    }

}
