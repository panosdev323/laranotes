<?php

namespace App\Http\Controllers;

use App\Models\Note;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TrashedNoteController extends Controller
{
    public function index() {
        $notes = Note::whereBelongsTo(Auth::user())
        ->onlyTrashed()
        ->orderBy('created_at', 'desc')
        ->paginate(5);
        return view('notes.index', ['notes' => $notes]);
    }

    public function show(string $uuid)
    {
        $note = Note::withTrashed()->where('uuid', $uuid)->firstOrFail();
        if ($note->user_id != Auth::id()) {
            return abort(403);
        }
        return view('notes.show', ['note' => $note]);
    }

    public function update(string $uuid)
    {
        $note = Note::withTrashed()->where('uuid', $uuid)->firstOrFail();
        if ($note->user_id != Auth::id()) {
            return abort(403);
        }
        $note->restore();
        return redirect()->route('notes.index')->with('success', 'Note restored');
    }

    public function destroy(string $uuid)
    {
        $note = Note::withTrashed()->where('uuid', $uuid)->firstOrFail();
        if ($note->user_id != Auth::id()) {
            return abort(403);
        }
        $note->forceDelete();
        return redirect()->route('trashed.index')->with('success', 'Note has been deleted successfully!');
    }
}
