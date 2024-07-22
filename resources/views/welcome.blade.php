<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{ config('app.name') }}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />
        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>
    <body class="font-sans antialiased dark:bg-black dark:text-white/50">
        <div class="bg-gray-50 text-black/50 dark:bg-black dark:text-white/50 min-h-screen flex flex-col">
            <header class="grid grid-cols-2 items-center gap-2 py-10 lg:grid-cols-3">
                @if (Route::has('login'))
                    <nav class="col-span-2 lg:col-span-3 flex justify-end space-x-4">
                        @auth
                            <a
                                href="{{ url('/notes') }}"
                                class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-black/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-white"
                            >
                                Dashboard
                            </a>
                        @else
                            <a
                                href="{{ route('login') }}"
                                class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-black/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-white"
                            >
                                Log in
                            </a>

                            @if (Route::has('register'))
                                <a
                                    href="{{ route('register') }}"
                                    class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-black/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-white"
                                >
                                    Register
                                </a>
                            @endif
                        @endauth
                    </nav>
                @endif
            </header>
            <main class="flex-grow container mx-auto px-6 py-8">
                <h1 class="text-4xl font-bold mb-6 text-center">Stay Organized and Informed with Notes and Events</h1>
                <p class="text-lg mb-4 text-center">Welcome to our Laravel-powered application, your one-stop destination for managing your notes and keeping track of important events. Whether you're jotting down thoughts, planning your next big project, or staying on top of your schedule, our application offers an intuitive and user-friendly platform to help you stay organized and productive.</p>
                <div class="space-y-8">
                    <div>
                        <h3 class="text-2xl font-semibold mb-2">1. Manage Your Notes:</h3>
                        <ul class="list-disc list-inside space-y-1">
                            <li><strong>Create and Edit:</strong> Easily create new notes and edit existing ones with our simple and clean interface.</li>
                            <li><strong>Organize:</strong> Categorize your notes for better organization and quicker access.</li>
                            <li><strong>Search:</strong> Use our powerful search feature to find specific notes quickly.</li>
                        </ul>
                    </div>
                    <div>
                        <h3 class="text-2xl font-semibold mb-2">2. Events Calendar:</h3>
                        <ul class="list-disc list-inside space-y-1">
                            <li><strong>Schedule Events:</strong> Plan and schedule your events, meetings, and deadlines effortlessly.</li>
                            <li><strong>Reminders:</strong> Set reminders to ensure you never miss an important date or event.</li>
                            <li><strong>View Modes:</strong> Toggle between different calendar views to see your schedule by day, week, or month.</li>
                        </ul>
                    </div>
                    <div>
                        <h3 class="text-2xl font-semibold mb-2">3. User-Friendly Interface:</h3>
                        <ul class="list-disc list-inside space-y-1">
                            <li><strong>Dashboard:</strong> Access your notes and events from a unified dashboard that provides a quick overview of your activities.</li>
                            <li><strong>Responsive Design:</strong> Our application is fully responsive, ensuring a seamless experience on both desktop and mobile devices.</li>
                        </ul>
                    </div>
                    <div>
                        <h3 class="text-2xl font-semibold mb-2">4. Secure and Private:</h3>
                        <ul class="list-disc list-inside space-y-1">
                            <li><strong>Authentication:</strong>  Secure login and registration to protect your data.
                            </li>
                            <li><strong>Privacy:</strong>  Your notes and events are private and only accessible to you.
                            </li>
                        </ul>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>
