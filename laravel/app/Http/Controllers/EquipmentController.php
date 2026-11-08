<?php

namespace App\Http\Controllers;
use App\Models\Equipment;
use Illuminate\Http\Request;

class EquipmentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Equipment::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'description' => 'required|string',
            'image_path' => 'nullable|string',
        ]);
        return Equipment::create($request->all());
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return Equipment::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request,int $id)
    {
        $equipment = Equipment::findOrFail($id);
        $request->validate([
            'name' => 'sometimes|string|max:255',
            'description' => 'sometimes|string',
            'image_path' => 'nullable|string',
        ]);
        $equipment->update($request->all());
        return $equipment;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        $equipment = Equipment::findOrFail($id);
        $equipment->delete();
        return response()->noContent();
    }
}
