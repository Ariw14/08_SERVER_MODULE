<?php

namespace App\Http\Controllers;

use App\Models\societiesModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function signin(Request $request)
    {
        $request->validate([
            'id_card_number' => 'required',
            'password' => 'required',
        ]);

        $societies = societiesModel::all()->makeHidden('id');

        

        return response()->json([
            $societies,
        ],200);
    }


}
