<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ !$note->trashed() ?  __('Notes') : __('Trash') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <x-alert-success>
                {{session('success')}}
            </x-alert-success>
            <div class="my-6 p-6 bg-white border-b border-gray-200 shadow rounded">
                @if(!$note->trashed())
                    <div class="flex justify-end items-center">
                        <p class="opacity-90 me-4">
                            <strong>Created: </strong> {{$note->created_at}}
                        </p>
                        <a href="{{ route('notes.edit', ['uuid' => $note->uuid]) }}" class="btn-link">Edit</a>
                        <form action="{{ route('notes.destroy', ['uuid' => $note->uuid]) }}" method="post">
                            @method('delete')
                            @csrf
                            <button type="submit" class="btn btn-danger ml-2" onclick="return confirm('Are you sure you want to send to trash this note?')">Trash</button>
                        </form>
                    </div>
                @else
                <div class="flex justify-end items-center">
                    <p class="opacity-90 me-4">
                        <strong>Deleted : </strong> {{$note->deleted_at}}
                    </p>
                    <form action="{{ route('trashed.update', ['note' => $note->uuid]) }}" method="post">
                        @method('put')
                        @csrf
                        <button type="submit" class="btn btn-link ml-2">Restore</button>
                    </form>
                    <form action="{{ route('trashed.destroy', ['note' => $note->uuid]) }}" method="post">
                        @method('delete')
                        @csrf
                        <button type="submit" class="btn btn-danger ml-2" onclick="return confirm('Are you sure you want to permanently delete this note?')">Delete Permanently</button>
                    </form>
                </div>
                @endif
                <h2 class="font-bold text-2xl">
                    {{$note->title}}
                </h2>
                <p class="mt-2">{{$note->text}}</p>
                <small class="opacity-90">{{$note->updated_at->diffforHumans()}}</small>
            </div>
        </div>
    </div>
</x-app-layout>
