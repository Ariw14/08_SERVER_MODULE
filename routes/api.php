<?php

use App\Http\Controllers\ApplicationsController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CarsController;
use App\Http\Controllers\ValidationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::prefix('v1/auth')->group(function (){
    route::post('/login', [AuthController::class, 'signin']);
    route::post('/logout', [AuthController::class, 'signout']);
});

route::prefix('v1')->group(function (){
    //validation
    route::post('/validation', [ValidationController::class, 'validate']);
    route::get('/validations', [ValidationController::class, 'getdata']);
    //instalment
    route::get('/instalment_cars', [CarsController::class, 'getdata']);
    route::get('/instalment_cars/{id}', [CarsController::class, 'getdatabyid']);
    //aplication
    route::post('/applications', [ApplicationsController::class, 'apply']);
    route::get('/applications', [ApplicationsController::class, 'getdata']);
});