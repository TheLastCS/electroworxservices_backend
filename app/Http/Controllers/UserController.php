<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return User::all();
    }

     /**
     * Logs in a user.
     *
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $user = User::where('email',$request->email)->first();
        if(!$user || !Hash::check($request->password, $user->password) || $request->trashed)
        {
            return ["error" => "Email and/or Password does not match"];
        }
        return $user;
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
            'firstName' => 'required|max:50',
            'lastName' => 'required|max:50',
            'email' => 'required|max:255',
            'password' => 'required|confirmed|min:6',
            'phone' => 'required|digits:11',
        ]);

        return User::create(['firstName'=>$request->firstName,
                            'lastName'=>$request->lastName,
                            'email'=> $request->email,
                            'password'=>Hash::make($request->password),
                            'userType'=>$request->userType,
                            'phone'=>$request->phone,
                            ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return User::find($id);
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
        $user = User::find($id);
        $user->update([
            'first_name'=>$request->first_name,
            'last_name'=>$request->last_name,
            'email'=> $request->email,
            'password'=>Hash::make($request->password),
            'userType'=>$request->userType,
            'phone'=>$request->phone,
        ]);
        return $user;
    }

    /**
     * Change the specified resource delete_at.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $request = User::findOrFail($id);
        $request->delete();
        return response()->json(['deleted_at' => $request->deleted_at], 200);
    }


    public function restore($id) {
        $request = User::onlyTrashed()->findOrFail($id);
        $request->restore();

        return response()->json($request, 200);
    }

    public function onlyTrashed() {
        $request = User::onlyTrashed()->get();

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
        return User::destroy($id);
    }

    public function logout() {
        auth()->logout();
    }
}
