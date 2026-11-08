<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WorkoutSchedule extends Model
{
    protected $table = 'workout_schedules';
    protected $fillable = [
        'day',
        'category',
        'description'
    ];
}
