@if(session('success'))
    <div class="mb-4 px-4 py-2 bg-green-300 border border-green-200">
        {{ $slot }}
    </div>
@endif