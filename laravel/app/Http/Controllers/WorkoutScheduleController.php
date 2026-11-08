<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\WorkoutSchedule;
use Illuminate\Http\Request;

class WorkoutScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return WorkoutSchedule::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'day' => 'required|string|max:255',
            'category' => 'required|string|max:255',
            'description' =>'nullable|string'
        ]);
        return WorkoutSchedule::create($request->all());
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return WorkoutSchedule::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, int $id)
    {
        $schedule = WorkoutSchedule::findOrFail($id);
        $request->validate([
            'day' => 'sometimes|required|string|max:255',
            'category' => 'sometimes|required|string|max:255',
            'description' => 'sometimes|nullable|string'
        ]);
        $schedule->update($request->all());
        return $schedule;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $schedule = WorkoutSchedule::findOrFail($id);
        $schedule->delete();
        return response()->noContent();
    }
}
