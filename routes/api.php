<?php

use App\Http\Controllers\AppointmentController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Users
Route::post('/users/login', [UserController::class, 'login']);
Route::post('/users/signup', [UserController::class, 'store']);
Route::get('/users', [UserController::class, 'index']);
Route::get('/users/{id}', [UserController::class, 'show']);

Route::post('/users/update/{id}', [UserController::class, 'update']);
Route::delete('/users/{id}', [UserController::class, 'delete']);
Route::delete('/users/destroy/{id}', [UserController::class, 'destroy']);

Route::get('/users/onlyTrashed', [UserController::class, 'onlyTrashed']);
Route::patch('users/onlyTrashed/restore/{id}', [UserController::class, 'restore']);

// Appointments
Route::get('/appointments', [AppointmentController::class, 'index']);
Route::get('/appointments/{id}', [AppointmentController::class, 'show']);

Route::post('/appointments', [AppointmentController::class, 'store']);

Route::put('/appointment/{id}', [AppointmentController::class, 'update']);
Route::delete('/appointment/{id}', [AppointmentController::class, 'delete']);
Route::delete('/appointments/{id}', [AppointmentController::class, 'destroy']);

Route::get('/appointments/onlyTrashed', [AppointmentController::class, 'onlyTrashed']);
Route::patch('/appointments/onlyTrashed/{id}', [AppointmentController::class, 'restore']);