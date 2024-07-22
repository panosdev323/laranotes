<?php

namespace App\Http\Controllers;
use Carbon\Carbon;
use App\Models\Event;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class EventController extends Controller
{
    public function index()
    {
        $events = Event::orderBy('created_at', 'desc')->paginate(5);
        return view('events.index', ['events' => $events]);
    }

    public function create()
    {
        return view('events.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:120|min:5',
            'description' => 'required|min:20',
            'start_time' => 'required|date_format:Y-m-d',
            'end_time' => 'required|date_format:Y-m-d|after_or_equal:start_time',
        ]);

        Event::create([
            'name' => $request->name,
            'description' => $request->description,
            'start_time' => Carbon::parse($request->start_time)->format('Y-m-d'),
            'end_time' => Carbon::parse($request->end_time)->format('Y-m-d'),
            'user_id' => Auth::id(),
        ]);

        return redirect()->route('events.index')->with('success', 'Event created successfully!');
    }

    public function show(string $id)
    {
        $event = Event::where('id', $id)->firstOrFail();
        return view('events.show', ['event' => $event]);
    }

    public function edit(string $id)
    {
        $event = Event::where('id', $id)->where('user_id', auth()->id())->firstOrFail();

        if ($event->user_id != Auth::id()) {
            return abort(403, 'Unauthorized action.');
        }
        
        // Convert to Carbon instance if they are not already
        if (is_string($event->start_time)) {
            $event->start_time = Carbon::parse($event->start_time);
        }
        if (is_string($event->end_time)) {
            $event->end_time = Carbon::parse($event->end_time);
        }
        // Format the dates
        $event->start_time = $event->start_time->format('Y-m-d');
        $event->end_time = $event->end_time->format('Y-m-d');
        return view('events.edit', ['event' => $event]);
    }

    public function update(Request $request, string $id)
    {
        $event = Event::where('id', $id)->where('user_id', auth()->id())->firstOrFail();

        if ($event->user_id != Auth::id()) {
            return abort(403, 'Unauthorized action.');
        }

        $request->validate([
            "name" => "required|max:120|min:5",
            "description" => "required|min:20",
            'start_time' => 'required|date_format:Y-m-d',
            'end_time' => 'required|date_format:Y-m-d|after_or_equal:start_time',
        ]);

        $event->update([
            'name' => $request->name,
            'description' => $request->description,
            'start_time' => Carbon::parse($request->start_time)->format('Y-m-d'),
            'end_time' => Carbon::parse($request->end_time)->format('Y-m-d'),
            'updated_at' => Carbon::now()
        ]);

        // Redirect to the updated event's show page with a success message, using id
        return redirect()->route('events.show', ['id' => $event->id])->with('success', 'Event updated successfully!');
    }

    public function destroy($id)
        {
            $event = Event::findOrFail($id);
            if ($event->user_id != Auth::id()) {
                return abort(403, 'Unauthorized action.');
            }
            $event->delete();
            return redirect()->route('events.index')->with('success', 'Event deleted successfully!');
        }
}
