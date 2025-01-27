<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Notes') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <form action="{{ route('notes.store') }}" method="POST">
                @csrf
                <x-text-input 
                    type="text" 
                    field="title" 
                    name="title" 
                    id="title" 
                    placeholder="Title" class="w-full"
                    :value="@old('title')"
                >
                </x-text-input>
                <x-textarea 
                    field="text" 
                    name="text" 
                    id="text" 
                    cols="30" 
                    rows="10" 
                    placeholder="Start typing here..." 
                    class="w-full mt-1"
                    :value="@old('text')"
                >
                </x-textarea>
                <x-primary-button class="mt-1">Save Note</x-primary-button>
           </form>
        </div>
    </div>
</x-app-layout>
