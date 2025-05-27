<?php

namespace App\Http\Controllers;

use App\Models\Validationmodel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ValidationController extends Controller
{
    public function validate(Request $request){
        $societies = Auth::guard('api')->user()->id;
        $request->validate([
            'job' => 'required',
            'job_description' => 'required',
            'income' => 'required',
            'reason_accepted' => 'required',
        ]);

        Validationmodel::create([
            // 'id' => $societies->id,
            'job' => $request->job,
            'job_description' => $request->job_description,
            'income' => $request->income,
            'reason_accepted' => $request->reason_accepted,
        ]);


        return response()->json([
            'message' => 'Request data validation sent succesfull',
        ],200);
    }

    public function getdata(Request $request){

        $validation = Validationmodel::all();

        return response()->json([
            'validation' => $validation,
        ],200);
    }
}
