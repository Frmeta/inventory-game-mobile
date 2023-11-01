<h1>Inventory Game: Mobile Version</h1>

<h3>Tugas 7</h3>

**Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?**

Stateless widget adalah widget statis dimana seluruh konfigurasi yang dimuat didalamnya telah diinisiasi sejak awal yang tidak memiliki keadaan internal. Artinya, sekali dibuat, widget ini tidak dapat berubah. Ini cocok digunakan untuk bagian antarmuka pengguna yang tidak memerlukan perubahan atau interaksi dinamis.

Sedangkan stateful widget berlaku sebaliknya dimana sifatnya adalah dinamis yang dapat mengelola keadaan internal, sehingga widget ini dapat diperbaharui kapanpun dibutuhkan berdasarkan user actions atau ketika terjadinya perubahan data.

<br>

**Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.**

- MaterialApp: sebagai akar dari aplikasi Flutter yang dirancang menggunakan desain Material Design dari Google. MaterialApp menyediakan berbagai pengaturan dan konfigurasi untuk aplikasi, seperti tema, rute, dan banyak lagi.
- Material: untuk memberi warna pada latar belakang kartu
- MyHomePage: widget halaman utama aplikasi
- Text: untuk menampilkan teks
- Column: untuk mengatur widget dalam kolom vertikal
- AppBar: untuk menampilkan bilah atas di aplikasi
- Scaffold: untuk membuat tata letak dasar aplikasi
- GridView: untuk menampilkan elemen dalam tata letak grid
- GridView.count: untuk membuat grid layout dengan jumlah kolom yang didefinikan.
- SingleChildScrollView: untuk membuat area scrollable vertikal yang hanya memiliki satu widget anak.
- Padding: untuk menambah jarak di sekitar widget anaknya
- Container: untuk mengatur tata letak dan dekorasi widget anak di dalamnya. Anda dapat mengatur properti-properti seperti warna latar belakang, padding, margin, dan sebagainya menggunakan widget Container. Ini adalah salah satu widget yang sering digunakan untuk mengatur tampilan dalam antarmuka pengguna.
- InkWell: untuk memberi efek respons ketika kartu diklik. Biasanya digunakan di sekitar widget lain, seperti Text, Image, atau Container.
- Center: Center adalah widget yang digunakan untuk mengatur widget anaknya agar berada di tengah dari tata letak (layout) orang tua, baik secara horizontal maupun vertikal. Ini adalah widget yang sangat berguna untuk mengatur tampilan elemen di tengah layar atau di tengah area yang lebih besar.
- Icon: untuk menampilkan simbol dalam antarmuka pengguna Anda.
- SnackBar: untuk menampilkan pesan sementara ketika kartu diklik
- ItemCard: untuk menampilkan setiap elemen dalam grid sebagai kartu

<br>

**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)**

Install Flutter terlebih dahulu melalui [link ini](https://docs.flutter.dev/get-started/install/windows)
Buat project bernama `inventory_game` dengan cara menjalankan:
```bash
flutter create inventory_game
cd inventory_game
flutter run
```

Pada `inventory_game/lib`, buat file `main.dart` dan `menu.dart`. Isi dari `menu.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:inventory_game/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```
Isi dari `menu.dart`:
```dart
import 'package:flutter/material.dart';

class Item {
  final String name;
  final IconData icon;

  Item(this.name, this.icon);
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Item> items = [
    Item("Lihat Item", Icons.description),
    Item("Tambah Item", Icons.note_add),
    Item("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Game'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Inventory Game', // Text yang menandakan nama game
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((Item item) {
                  // Iterasi untuk setiap item
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.orange,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
Hubungkan hp Android anda dengan PC menggunakan kabel data lalu jalankan `flutter run`. App akan dibuild dan terinstall di HP anda untuk siap dibuka.