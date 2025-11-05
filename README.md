# adadis-mobile
## TUGAS 7
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


## TUGAS 8
### - Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Perbedaan utamanya terletak pada cara aplikasi mengelola "tumpukan" halaman. `Navigator.push()` berfungsi seperti menumpuk kartu; ia meletakkan halaman baru di atas halaman saat ini. Halaman yang lama masih ada di bawahnya, sehingga pengguna bisa menekan tombol "Kembali" untuk kembali ke halaman tersebut. Ini cocok digunakan saat Anda ingin pengguna bisa kembali, seperti saat melihat detail produk dari daftar produk.

Sebaliknya, `Navigator.pushReplacement()` mengganti halaman saat ini dengan halaman baru. Halaman yang lama akan dibuang dari tumpukan. Ini berguna dalam situasi di mana pengguna tidak seharusnya bisa kembali. Contoh paling umum adalah setelah proses login atau splash screen; setelah berhasil login, pengguna akan dibawa ke halaman utama, dan mereka tidak seharusnya bisa menekan "Kembali" untuk kembali ke halaman login.

### - Bagaimana kamu memanfaatkan *hierarchy* widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Ketiga widget ini adalah fondasi untuk membangun struktur visual yang konsisten. `Scaffold` adalah kerangka atau cetakan dasar untuk sebuah halaman; ia menyediakan "slot" standar untuk bagian-atas (`AppBar`), bagian-tengah (`body`), dan menu samping (`Drawer`). AppBar adalah bilah atas yang biasanya berisi judul halaman dan tombol navigasi kembali.

Untuk konsistensi dapat membuat satu widget `Drawer` kustom (seperti `left_drawer.dart`) yang berisi semua link navigasi utama aplikasi (Home, Profil, Kategori, Logout). Kemudian, di setiap halaman yang membutuhkan menu samping tinggal memanggil widget `Drawer` yang sama di dalam Scaffold. Hasilnya, menu navigasi akan terlihat identik di seluruh aplikasi.

### - Dalam konteks desain antarmuka, apa kelebihan menggunakan *layout widget* seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Saat membuat form, widget layout sangat penting untuk kenyamanan pengguna. `Padding` adalah yang paling dasar; fungsinya memberi "ruang napas" visual di sekitar elemen form agar tidak menempel rapat ke tepi layar atau menempel satu sama lain, membuat UI terlihat lebih bersih dan profesional.

`SingleChildScrollView` sangat krusial, terutama untuk form yang panjang. Saat pengguna mengisi form di HP, keyboard akan muncul dan memakan setengah layar. Tanpa `SingleChildScrollView`, keyboard bisa menutupi field yang sedang diisi dan menyebabkan error. Dengan membungkus form Anda menggunakan widget ini, seluruh form akan otomatis bisa di-scroll, sehingga pengguna tetap bisa mengakses semua field meskipun keyboard muncul. Sementara `ListView` juga bisa scroll, ia lebih dioptimalkan untuk menampilkan daftar item yang dinamis atau sangat panjang, seperti daftar produk di keranjang belanja.

### - Bagaimana kamu menyesuaikan *warna tema* agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Untuk konsistensi brand, kita tidak perlu mengatur warna pada setiap tombol atau `AppBar` satu per satu. Cara yang benar adalah dengan mendefinisikan palet warna Anda satu kali di dalam properti `theme` pada widget `MaterialApp` utama (biasanya di file `main.dart`). Di sinilah Anda menetapkan `primaryColor` (untuk `AppBar`), `colorScheme` (untuk tombol atau floating action button), dan bahkan gaya font. Flutter kemudian akan secara otomatis menerapkan skema warna ini ke seluruh widget di aplikasi Anda, sehingga identitas visual brand "Football Shop" Anda tetap terjaga secara konsisten di setiap halaman.