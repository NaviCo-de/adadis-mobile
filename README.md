# adadis-mobile
## TUTORIAL 1
### - Jelaskan apa itu *widget tree* pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar *widget*.
Dalam Flutter, *widget* tree adalah struktur hierarki dari semua *widget* yang membentuk tampilan aplikasi.
Setiap *widget* dapat memiliki satu atau lebih *widget* anak (child), dan setiap anak berada di dalam *widget* induk (parent).
Proses build Flutter akan memulai dari *widget* paling atas (biasanya MaterialApp), lalu menurunkan struktur ke bawah hingga semua elemen UI selesai dirender.

### - Sebutkan semua *widget* yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
| Widget                           | Fungsi                                                                                                             |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| `MaterialApp`                    | Root widget untuk aplikasi Flutter berbasis *Material Design*. Menyediakan tema, navigasi, dan konfigurasi global. |
| `ThemeData`                      | Menentukan skema warna dan gaya visual global aplikasi.                                                            |
| `MyHomePage`                     | Halaman utama aplikasi; di sini UI utama dibangun.                                                                 |
| `Scaffold`                       | Menyediakan struktur dasar halaman seperti `AppBar`, `body`, dan `floatingActionButton`.                           |
| `AppBar`                         | Bagian atas halaman yang menampilkan judul aplikasi.                                                               |
| `SingleChildScrollView`          | Membuat seluruh halaman bisa di-*scroll* jika kontennya lebih panjang dari layar.                                  |
| `Column`                         | Menyusun widget secara vertikal.                                                                                   |
| `Row`                            | Menyusun widget secara horizontal.                                                                                 |
| `InfoCard`                       | Widget kustom yang menampilkan informasi seperti NPM, Nama, dan Kelas.                                             |
| `Text`                           | Menampilkan teks.                                                                                                  |
| `Padding`, `Center`, `Container` | Mengatur tata letak, jarak, dan posisi elemen.                                                                     |

### - Apa fungsi dari *widget* `MaterialApp`? Jelaskan mengapa *widget* ini sering digunakan sebagai *widget* root.
`MaterialApp` berfungsi sebagai root widget untuk seluruh aplikasi berbasis Material Design.
Ia menyediakan:

Tema (`ThemeData`)

Navigasi (`home`, `routes`)

Judul aplikasi (`title`)

Pengaturan lokal dan debug.

Dalam proyek ini, `MaterialApp` digunakan di MyApp untuk menginisialisasi aplikasi dengan tema warna biru dan menentukan halaman utama (`home: MyHomePage()`).
### - Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`. Kapan kamu memilih salah satunya?
| Jenis Widget      | Karakteristik                                                                                          |
| ----------------- | ------------------------------------------------------------------------------------------------------ |
| `StatelessWidget` | Tidak memiliki state yang bisa berubah. UI-nya tetap selama siklus hidup widget.                       |
| `StatefulWidget`  | Memiliki state internal yang bisa berubah, dan bisa memanggil `setState()` untuk memperbarui tampilan. |
Dalam proyek ini, semua widget adalah `StatelessWidget`, karena data yang ditampilkan (nama, NPM, kelas) bersifat statis — tidak berubah selama aplikasi berjalan.
Jika nanti butuh UI dinamis (misalnya tombol counter, input user, atau API yang berubah), baru gunakan `StatefulWidget`.
### - Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di metode `build`?
`BuildContext` adalah objek yang merepresentasikan posisi suatu widget dalam *widget tree*.
Fungsi utamanya:

Mengakses tema, warna, atau data dari widget induk (`Theme.of(context)`, `Navigator.of(context)` dsb).

Menjadi acuan untuk membangun tampilan (`build(BuildContext context)`).
### - Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
| Fitur           | Penjelasan                                                                                               | Dampak terhadap state               |
| --------------- | -------------------------------------------------------------------------------------------------------- | ----------------------------------- |
| **Hot Reload**  | Menyuntikkan perubahan kode ke dalam aplikasi yang sedang berjalan tanpa memulai ulang seluruh aplikasi. | State aplikasi tetap (tidak reset). |
| **Hot Restart** | Memulai ulang seluruh aplikasi dari awal dan membangun ulang widget tree.                                | Semua state direset.                |
