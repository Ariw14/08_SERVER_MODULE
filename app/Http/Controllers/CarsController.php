<?php

namespace App\Http\Controllers;

use App\Models\carsmodel;
use Illuminate\Http\Request;

class CarsController extends Controller
{
    public function data(Request $request){
        // $installment = carsmodel::with(['brand', 'month'])->get()->first();
        $installment = carsmodel::all();
        // $installment = carsmodel::with('brand')->where('brand_id', $request->brand)->first();
        
        

        return response()->json([
            'cars' => $installment,
        ], 200);
    }
}
