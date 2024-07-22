<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 dark:text-gray-100">
                    <h3 class="text-2xl font-semibold mb-4">{{ __('User Details') }}</h3>
                    <p><strong>Name:</strong> {{ $user->name }}</p>
                    <p><strong>Email:</strong> {{ $user->email }}</p>
                    <p><strong>Joined:</strong> {{ $user->created_at->format('M d, Y') }}</p>
                    <!-- Add more user details as needed -->
                </div>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 mt-8">
                <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg p-6">
                    <h3 class="text-xl font-semibold mb-2">{{ __('Notes') }}</h3>
                    <p>{{ __('Manage your notes here. Create, edit, and organize your notes efficiently.') }}</p>
                    <a href="{{ route('notes.index') }}" class="mt-4 inline-block bg-blue-500 text-white font-semibold py-2 px-4 rounded hover:bg-blue-700 transition duration-200">
                        {{ __('Go to Notes') }}
                    </a>
                </div>
                <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg p-6">
                    <h3 class="text-xl font-semibold mb-2">{{ __('Events') }}</h3>
                    <p>{{ __('Keep track of public events and important dates. Schedule and manage your events easily.') }}</p>
                    <a href="{{ route('events.index') }}" class="mt-4 inline-block bg-blue-500 text-white font-semibold py-2 px-4 rounded hover:bg-blue-700 transition duration-200">
                        {{ __('Go to Events') }}
                    </a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
