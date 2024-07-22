<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\NoteController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TrashedNoteController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', [ProfileController::class, 'show'])
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::resource('notes', NoteController::class)->parameters(['notes' => 'uuid']);
    // Trashed
    Route::get('/trashed', [TrashedNoteController::class, 'index'])->name('trashed.index');
    Route::get('/trashed/{note}', [TrashedNoteController::class, 'show'])
    ->withTrashed()
    ->name('trashed.show');
    Route::put('/trashed/{note}', [TrashedNoteController::class, 'update'])
    ->withTrashed()
    ->name('trashed.update');
    Route::delete('/trashed/{note}', [TrashedNoteController::class, 'destroy'])
    ->withTrashed()
    ->name('trashed.destroy');
    Route::resource('events', EventController::class)->parameters(['events' => 'id']);
});

require __DIR__.'/auth.php';
