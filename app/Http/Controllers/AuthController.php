<?php

namespace App\Http\Controllers;

use App\Models\societiesModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Validator as ValidationValidator;

class AuthController extends Controller
{
    public function signin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_card_number' => 'required',
            'password' => 'required',
        ]);

        $society = societiesModel::with('regional')->where('id_card_number', $request->id_card_number)->first();
        
        if (!$society || $society->password !== $request->password){
            return response()->json([
                'message' => 'ID card number or password incorrect',
            ], 401);
        };
        
        $token = $society->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message'
        ]);
    }

    public function signout() {}
}
