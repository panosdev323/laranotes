<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Events')}}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <x-alert-success>
                {{session('success')}}
            </x-alert-success>
            @if(request()->routeIs('events.index'))
                <a href="{{route('events.create')}}" class="btn-link btn-lg">+ New Event</a>
            @endif
            @forelse ($events as $event)
                <div class="my-6 p-6 bg-white border-b border-gray-200 shadow rounded">
                    <h2 class="font-bold text-2xl text-blue-500 hover:text-blue-900 transition-colors duration-300">
                        <a 
                        @if(request()->routeIs('events.index'))
                            href="{{route('events.show', $event->id)}}"
                        @else
                            {{-- href="{{route('trashed.show', $note->uuid)}}" --}}
                        @endif
                        >{{$event->name}}</a>
                    </h2>
                    <p class="mt-2">{{Str::limit($event->description, 800)}}</p>
                    <small class="opacity-90">{{$event->updated_at->diffforHumans()}}</small>
                </div>
            @empty
                @if(request()->routeIs('notes.index'))
                    <p>You have no events yet.</p>
                @else
                    <p>No events in the trash.</p>
                @endif
            @endforelse
            <!-- Display pagination links -->
            <div class="pagination">
                {{ $events->links() }}
            </div>
        </div>
    </div>
</x-app-layout>
