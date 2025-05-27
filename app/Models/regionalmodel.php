<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class regionalmodel extends Model
{
    //
    protected $table = 'regionals';


    public function society(){
        return $this->hasMany(regionalmodel::class);
    }
}
