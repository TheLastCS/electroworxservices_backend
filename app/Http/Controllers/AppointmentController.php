<?php

namespace App\Http\Controllers;
use Carbon\Carbon;

use App\Models\Appointment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AppointmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return DB::table('appointments')->whereNull('deleted_at')->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'appType' => 'required',
            'start' => 'required',
            'end'  => 'required', 
            'title'  => 'required',
            'color'  => 'required',
           
            'user_id' => 'required',
        ]);

        // return $request->appointments()->create([
        Appointment::create(['appType' => $request->appType,
        'start' => Carbon::parse($request->start)->timezone('Asia/Singapore'),
        'end' => Carbon::parse($request->end)->timezone('Asia/Singapore'),
        'title' => $request->title,
        'color' => $request->color,
        'allDay' => false,
        'user_id' => $request->user_id,
        ]);

        return DB::table('appointments')->whereNull('deleted_at')->get();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Appointment::find($id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $appointment = Appointment::find($id);
        $appointment->update([
            'appType'=>$request->appType,
            'start' => Carbon::parse($request->start)->timezone('Asia/Singapore'),
            'end' => Carbon::parse($request->end)->timezone('Asia/Singapore'),
            'title' => $request->title,
            'color' => $request->color,
            'user_id' => $request->user_id,
        ]);
        return DB::table('appointments')->whereNull('deleted_at')->get();
    }

    /**
     * Change the specified resource delete_at.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $appointment = Appointment::find($id);
        $appointment->delete();
        return DB::table('appointments')->whereNull('deleted_at')->get();
    }

    public function restore($id) {
        $request = Appointment::onlyTrashed()->findOrFail($id);
        $request->restore();
        return response()->json($request, 200);
    }

    public function onlyTrashed() {
        $request = Appointment::onlyTrashed()->get();
        return response()->json($request, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return Appointment::destroy($id);
    }
}
