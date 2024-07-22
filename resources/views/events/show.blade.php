<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Events') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <x-alert-success>
                {{session('success')}}
            </x-alert-success>
            <div class="my-6 p-6 bg-white border-b border-gray-200 shadow rounded">
                <div class="flex justify-end items-center">
                    <p class="opacity-90 me-4">
                        <strong>Created: </strong> {{$event->created_at}}
                    </p>
                    @if ($event->user_id === auth()->id())
                        <a href="{{ route('events.edit', ['id' => $event->id]) }}" class="btn-link">Edit</a>
                        <form action="{{ route('events.destroy', ['id' => $event->id]) }}" method="post">
                            @method('DELETE')
                            @csrf
                            <button type="submit" class="btn btn-danger ml-2" onclick="return confirm('Are you sure you want to delete this event?')">Delete</button>
                        </form>                        
                    @endif
                </div>
                <h2 class="font-bold text-2xl">
                    {{$event->name}}
                </h2>
                <p class="mt-2">{{$event->description}}</p>
                <div class="flex items-center  justify-between mt-3">
                    <div class="flex items-center space-x-1">
                        <strong>Start Time:</strong>
                        <button class="mt-2 btn-link">{{$event->start_time}}</button>
                    </div>
                    <div class="flex items-center space-x-1">
                        <strong>End Time:</strong>
                        <button class="mt-2 btn-link">{{$event->end_time}}</button>
                    </div>
                </div>
                <div class="mt-3">
                    <small class="opacity-90">{{$event->updated_at->diffforHumans()}}</small>
                </div>
                </div>
                
        </div>
    </div>
</x-app-layout>
