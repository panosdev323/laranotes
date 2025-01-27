<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Note;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NoteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $userId = Auth::id();
        // without relationship
        // $notes = Note::where('user_id', $userId)->paginate(5); 
        // with relationship
        $notes = Note::whereBelongsTo(Auth::user())
        ->orderBy('created_at', 'desc')
        ->paginate(5);
        return view('notes.index', ['notes' => $notes]); // Pass notes as an array
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('notes.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            "title" => "required|max:120|min:5",
            "text" => "required|min:20",
        ]);
        $note = new Note([
            'uuid' => Str::uuid(),
            'user_id'=> Auth::id(),
            'title'=> $request->title,
            'text'=> $request->text,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ]);
        $note->save();
         // Optionally, you can redirect or respond with a message
         return redirect()->route('notes.index')->with('success', 'Note created successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $uuid)
    {
        $note = Note::where('uuid', $uuid)->firstOrFail();
        return view('notes.show', ['note' => $note]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $uuid)
    {
        $note = Note::where('uuid', $uuid)->firstOrFail();

        if ($note->user_id != Auth::id()) {
            return abort(403);
        }
        return view('notes.edit', ['note' => $note]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $uuid)
    {
        $note = Note::where('uuid', $uuid)->firstOrFail();

        if ($note->user_id != Auth::id()) {
            return abort(403);
        }

        $request->validate([
            "title" => "required|max:120|min:5",
            "text" => "required|min:20",
        ]);

        $note->update([
            'title' => $request->title,
            'text' => $request->text,
            'updated_at' => Carbon::now()
        ]);

        // Redirect to the updated note's show page with a success message, using UUID
        return redirect()->route('notes.show', ['uuid' => $note->uuid])->with('success', 'Note updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $uuid)
    {
        $note = Note::where('uuid', $uuid)->firstOrFail();
        if ($note->user_id != Auth::id()) {
            return abort(403);
        }
        $note->delete();
        return redirect()->route('notes.index')->with('success', 'Note has been trashed successfully!');
    }
}
