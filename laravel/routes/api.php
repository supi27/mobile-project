<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EquipmentController;
use App\Http\Controllers\WorkoutScheduleController;

Route::apiResource('equipment', EquipmentController::class);
route::apiResource('workout_schedules',WorkoutScheduleController::class);