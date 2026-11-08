<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Equipment extends Model
{
    // Beritahu Laravel bahwa nama tabel Anda adalah 'Equipment'
    protected $table = 'equipment';

    // Daftarkan kolom yang boleh diisi secara massal untuk mengatasi error 500
    protected $fillable = [
        'name',
        'description',
        'image_path'
    ];
}
