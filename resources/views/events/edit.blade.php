<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Edit Event') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <form action="{{ route('events.update', ['id' => $event->id]) }}" method="POST">
                @method('put')
                @csrf
                <x-text-input 
                    type="text" 
                    field="name" 
                    name="name" 
                    id="name" 
                    placeholder="Name" class="w-full"
                    :value="@old('name', $event->name)"
                >
                </x-text-input>
                <x-textarea 
                    field="description" 
                    name="description" 
                    id="description" 
                    cols="30" 
                    rows="10" 
                    placeholder="Start typing here..." 
                    class="w-full mt-1"
                    :value="@old('description', $event->description)"
                >
                </x-textarea>
                <p>Start Date</p>
                <x-text-input 
                type="date" 
                field="start_time" 
                name="start_time" 
                id="start_time" 
                placeholder="Start Time" class="w-full"
                :value="@old('start_time', $event->start_time)"
                >
                </x-text-input>
                <p class="mt-1">End Date</p>
                <x-text-input 
                type="date" 
                field="end_time" 
                name="end_time" 
                id="end_time" 
                placeholder="End Time" class="w-full"
                :value="@old('end_time', $event->end_time)"
                >
                </x-text-input>
                <x-primary-button class="mt-1">Save Event</x-primary-button>
           </form>
        </div>
    </div>
</x-app-layout>
