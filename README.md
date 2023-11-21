<h1>Inventory Game: Mobile Version</h1>

<details>
<summary>Tugas 7</summary>

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
- GridView.count: untuk membuat grid layout dengan jumlah kolom yang didefinisikan.
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
Hubungkan HP Android anda dengan PC menggunakan kabel data lalu jalankan `flutter run`. App akan dibuild dan terinstall di HP anda untuk siap dibuka.

</details>

<details>
<summary>Tugas 8</summary>

**Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!**

Navigator.push()
- Menampilkan halaman baru dengan cara menambahkannya ke paling atas stack. Pengguna dapat kembali ke halaman sebelumnya. Contoh penggunaan:
```dart
Navigator.push(context, MaterialPageRoute(builder: (context) => PageName()))
```

Navigator.pushReplacement()
- Menampilkan halaman baru dengan cara menggantikan halaman yang berada di posisi paling atas stack dengan halaman baru tersebut. Akibatnya pengguna tidak dapat kebali ke halaman sebelumnya dengan mudah. Contoh penggunaan:
```dart
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PageName()))
```
<br> 

**Jelaskan masing-masing *layout* widget pada Flutter dan konteks penggunaannya masing-masing!**
1. Row
   - Mengatur elemen secara horizontal dari kiri ke kanan
   - Penggunaan: penataan tombol dan judul pada navigasi dalam baris

2. Column
   - Mengatur elemen secara vertikal dari atas ke bawah
   - Penggunaan: menata daftar item pada formulir

3. Center
   - Meletakkan elemen di tengah
   - Penggunaan: meletakkan elemen di tengah layar

4. Container
   - Sebagai wadah untuk mengatur tata letak dan gaya elemen pada aplikasi seperti padding, margin, borders, dan color
   - Penggunaan: memberi padding, margin, border, dan color pada elemen

5. ListView
   - Membuat daftar yang dapat discroll
   - Penggunaan: daftar item yang sangat panjang

6. Stack
   - Menumpuk elemen-elemen di atas satu sama lain
   - Penggunaan: ketika ingin menumpuk gambar, icon, dan teks di satu tumpukan

7. Expanded
   - Digunakan di dalam Row atau Column untuk mengatur bagian yang mengisi sisi ruang yang tersedia
   - Penggunaan: ketika ingin membagi ruang yang tersedia secara proporsional antara beberapa elemen

8. Sizedbox
   - Menentukan ukuran lebar dan tinggi dari sebuah widget
   - Penggunaan: mengatur ruang kosong atau mengontrol ukuran elemen dalam tata letak Anda

9. Card
   - Untuk mengelilingi elemen-elemen seperti gambar, teks, atau tombol untuk membuat tampilan kartu
   - Penggunaan: sering digunakan dalam daftar item atau dalam konteks informasi yang terkandung dalam satu blok visual

10. GridView
    - Menampilkan elemen dalam tata letak berbentuk grid atau tabel. Kita dapat megnatur jumlah kolom, menggulir elemen-elemen dalam grid, dan mengontrol tampilan yang berbeda untuk setiap elemen
    - Pengunaan: ketika ingin menampilakn elemen dalam bentuk tabel

11. Wrap
    - Mengatur elemen-elemen dalam baris atau kolom yang berjajar tetapi elemen-elemen tersebut tidak muat dalam baris atau kolom tersebut, sehingga mereka melanjutkan ke baris atau kolom berikutnya
    - Penggunaan: menata elemen yang ingin dilanjutkan ke baris atau kolom berikutnya
 
12. Align
    - Mengatur posisi *align* dari child terhadap elemen parentnya.
    - Penggunaan: ketika ingin meletakkan tombol di pojok kanan bawah layar

13. AspectRatio
    - Mengatur ukuran suatu elemen berdasarkan aspect ratio tertentu
    - Penggunaan: mengatur aspect ratio dari elemen sehingga tidak berubah meskipun menggunakan device yang berbeda

14. Baseline
    - Mengatur posisi suatu elemen sehingga *baseline*/garis dasarnya sejajar
    - Pengunaan: ketika ingin memposisikan elemen terhadap garis dasarnya

15. Constrainedbox
    - Mengatur batasan lebar dan tinggi minimum dan maksimum untuk elemen-elemen anaknya.
    - Penggunaan: untuk mengontrol ukuran dari elemen secara detail

16. Padding
    - Menambahkan jarak (padding) di sekeliling anaknya
    - Penggunaan: mengatur ruang antara elemen-elemen dalam tata letak

17. Transform
    - Mentransformasikan atau mengubah elemen-elemen anaknya seperti menggeser, memutar, atau mengubah ukuran mereka.
    - Penggunaan: membuat efek visual atau animasi

<br> <br>

**Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!**

Elemen input yang dipakai yakni `TextFormField` untuk menerima input nama item, jumlah, dan deskripsi. Saya menggunakan elemen input ini karena elemen ini cocok digunakan untuk mengumpulkan input dari pengguna dalam bentuk teks.
<br>

**Bagaimana penerapan *clean architecture* pada aplikasi Flutter?**

Clean architecture adalah pendekatan yang memisahkan kode menjadi lapisan-lapisan yang independen dan saling tergantung. Ini memungkinkan pengembangan aplikasi lebih terstruktur, mudah diuji, dan mudah dipelihara. 

Berikut ini lapisan-lapisan clean architecture pada aplikasi Flutter:
1. Presentation Layer (Lapisan Presentasi)
   - Lapisan yang berisi kode terkait tampilan pengguna (manajemen keadaan UI)
2. Business Logic Layer (Lapisan Logika Bisnis)
   - Lapisan yang berisi logika bisnis utama dalam aplikasi yang terpisah dari lapisan tampilan. Flutter biasa menggunakan pola desain seperti BLoC (Business Logic Component), Provider, atau Redux untuk mengelola logika bisnis.
3. Data Layer (Lapisan Data)
   - Lapisan yang berisi kode yang berhubungan akses ke data seperti API panggilan, basis data, penyimpanan lokal, atau sumber data eksternal lainnya.
<br>

**Jelaskan bagaimana cara kamu mengimplementasikan *checklist* di atas secara *step-by-step*! (bukan hanya sekadar mengikuti tutorial)**

Untuk membuat drawer pada aplikasi agar dapat mengakses berbagai macam halaman dengan mudah, masukkan drawer atau endDrawer pada Scaffold pada `menu.dart`.
```dart
return Scaffold(
  appBar: ...
  endDrawer: const RightDrawer(),
  body: ...
```

Kemudian saya membuat file baru bernama `right_drawer.dart` yang berisi StatelessWidget `RightDrawer`.
```dart
import 'package:flutter/material.dart';
import 'package:inventory_game/screens/menu.dart';
import 'package:inventory_game/screens/form.dart';
import 'package:inventory_game/screens/list_item.dart';

class RightDrawer extends StatelessWidget {
  const RightDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color:
                    Color.fromARGB(255, 15 * 16 + 7, 12 * 16 + 4, 10 * 16 + 5),
              ),
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    Text('Inventory Game',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('This is Inventory Game\'s drawer',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ]))),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('Lihat Item'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListItemPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_add_outlined),
            title: const Text('Tambah Item'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InventoryFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
```

Kemudian saya membuat halaman Form ketika user ingin menambah item dengan membuat StatefulWidget `InventoryFormPage` pada file `form.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:inventory_game/screens/list_item.dart';
import 'package:inventory_game/screens/menu.dart';
import 'package:inventory_game/widgets/right_drawer.dart';

class InventoryFormPage extends StatefulWidget {
  const InventoryFormPage({super.key});

  @override
  State<InventoryFormPage> createState() => _InventoryFormPageState();
}

class _InventoryFormPageState extends State<InventoryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Tambah Item'),
        backgroundColor:
            const Color.fromARGB(255, 15 * 16 + 7, 12 * 16 + 4, 10 * 16 + 5),
      ),
      endDrawer: const RightDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Item name",
                labelText: "Item name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _name = value!;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Name can not be empty!";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Amount",
                labelText: "Amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _amount = int.parse(value!);
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Amount can not be empty!";
                }
                if (int.tryParse(value) == null) {
                  return "Amount must be an integer!";
                }
                if (int.parse(value) < 0) {
                  return "Amount must be positive integer!";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Description",
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _description = value!;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Description can not be empty!";
                }
                return null;
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    setState(() {
                      WiListItemPage.database.add(InventoryItem(_name, _amount, _description));
                    });

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Item successfully saved.'),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name: $_name'),
                                Text("Amount: $_amount"),
                                Text("Description: $_description")
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                    _formKey.currentState!.reset();
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
```

Lalu saya juga membuat file `list_item.dart` ketika user ingin melihat daftar item yang sudah dibuat:
```dart
import 'package:flutter/material.dart';
import 'package:inventory_game/screens/menu.dart';
import 'package:inventory_game/widgets/right_drawer.dart';
import 'dart:math' as math;

class ListItemPage extends StatefulWidget {
  const ListItemPage({super.key});

  @override
  State<ListItemPage> createState() => WiListItemPage();
}

class WiListItemPage extends State<ListItemPage> {
  static List<InventoryItem> database = <InventoryItem>[
    InventoryItem("Baju", 12, "Pakaian"),
    InventoryItem("Laptop", 2, "Teknologi"),
    InventoryItem("Buku", 20, "Kumpulan kertas"),
    InventoryItem("Tas", 4, "Dapat membawa banyak barang"),
    InventoryItem("Charger Laptop", 2, "Dapat mengisi baterai laptop"),
    InventoryItem("HP", 10, "Alat komunikasi paling penting"),
    InventoryItem("Charger HP", 20, "Dapat mengisi baterai HP"),
    InventoryItem("Mouse", 1, "Untuk mengarahkan pointer pada laptop"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Inventory Game',
              style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: const Color(0xFFF7C4A5)),
      endDrawer: const RightDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // judul
              const Padding(
                padding: EdgeInsets.only(top: 40.0, bottom: 0.0),
                child: Text(
                  'Lihat Item',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: database.map((InventoryItem inventoryItem) {
                  return InventoryItemCard(inventoryItem);
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InventoryItemCard extends StatelessWidget {
  final InventoryItem inventoryItem;

  const InventoryItemCard(this.inventoryItem, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
            decoration: const BoxDecoration(
                color: Color(0xFFF7C4A5),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Text(
                inventoryItem.name,
                textAlign: TextAlign.left,
                
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                
              ),
              Text("Amount: ${inventoryItem.amount}"),
              Text("Description: ${inventoryItem.description}")
            ])));

    //;
  }
}

```


Terakhir, mengarahkan user ke halaman yang sesuai ketika user menekan tombol 'Lihat Item' dan 'Tambah Item' pada halaman utama.
```dart
  onTap: () {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          content: Text("Kamu telah menekan tombol ${item.name}!")));

    // Pindah halaman
    if (item.name == "Tambah Item") {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const InventoryFormPage()));
    } else if (item.name == "Lihat Item") {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const ListItemPage()));
    }
  },
```
</details>

<details>
<summary> Tugas 9 </summary>

**Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**

Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Pengambilan data JSON adalah proses membaca atau mengonsumsi data yang dikirimkan dalam format JSON. Ini bisa dilakukan dengan menggunakan bahasa pemrograman yang mendukung pengolahan JSON atau melalui library khusus yang ada dalam banyak bahasa pemrograman. Sedangkan pembuatan model seringkali terkait dengan kebutuhan analisis data yang lebih dalam, seperti pembelajaran mesin (machine learning) di mana Anda ingin membuat model berdasarkan data yang Anda miliki.

Apakah lebih baik melakukan pengambilan data JSON tanpa membuat model terlebih dahulu atau tidak tergantung pada kebutuhan dan tujuan Anda:
- Jika tujuannya hanya untuk mengakses atau menampilkan data JSON yang diterima dari suatu API atau sumber data lainnya, lebih baik tidak membuat model.
- Jika tujuannya untuk menganalisis data lebih lanjut, memprediksi pola, atau membuat rekomendasi berdasarkan data tersebut, perlu membangun model.

**Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**

CookieRequest berfungsi untuk mengelola permintaan request yang berhubungan dengan cookie dalam aplikasi. Dimana class ini akan menngatur hal-hal yang berkaitan dengan data yang disimpan di sisi cllient untuk melacak informasi terkait sesi pengguna.

Instance CookieRequest perlu dibagikan ke semua komponen untuk memastikan bahwa manajemen cookie dilakukan dengan cara yang seragam di semua komponen dalam aplikasi tersebut sehingga sesi pengguna akan dipelihata dengan konsisten.

**Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.**

1. Gunakan package dan library yang diperlukan, contohnya http dan convert.
```dart
import 'package:http/http.dart' as http;
import 'dart:convert';
```
2. Fetch data menggunakan HTTP untuk meminta data dari server yang memiliki data JSON tersebut.
```dart
  Future<List<Item>> fetchItem() async {
    var response = await http.get(
      Uri.parse(
        //'http://fredo-melvern-tugas.pbp.cs.ui.ac.id/json/'
        'http://127.0.0.1:8000/json/'
        //'http://127.0.0.1:8000/get-flutter/'
        );,
      headers: {"Content-Type": "application/json"},
    );
  }
```

3. Parsing atau convert response tersebut ke dalam bentuk JSON.
```dart
Future<void> getData() async {
  try {
    var jsonData = await fetchData();
    List<dynamic> dataList = jsonData.body;

  } catch (e) {
    print('Error: $e');
  }
}
```

4. Menampilkan data di flutter contohnya menggunakan ListView.builder

```dart
ListView.builder(
  itemCount: dataList.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(dataList[index]['title']),
      subtitle: Text(dataList[index]['description']),
    );
  },
);
```

**Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**

Pertama menggunakan package `pbp_django_auth`, dibuat CookieRequest baru masukkan ke variabel bernama request.
```dart
final request = context.watch<CookieRequest>();
```

Pada `login.dart`, aplikasi akan meminta input teks berupa username & password. Ketika disubmit, akan dipanggil:
```dart
final response = await request.login(
  "http://127.0.0.1:8000/auth/login/",
  {
    'username': username,
    'password': password
  }
);
```
dimana username dan password tersebut akan dikirmkan request ke projek Django agar user di authenticate & login. Jika sukses akan mengembalikan JsonResponse sukses, dan gagal jika sebaliknya.
```dart

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```

**Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.**

- TextField : menerima input teks dari pengguna. Pada tugas ini digunakan untuk menerima username dan password saat login dan registrasi.
- SizedBox : membuat ruang tertentu. Pada tugas ini dugnakan untuk memberikan jarak atau pemisah antara TextField username dan passowrd.
- ElevatedButton : membuat tombol yang memiliki efek elevasi ketika ditekan. Pada tugas ini digunakan sebagai tombol submit pada saat login dan registrasi.
- TextButton : membuat tombol berupa teks tanpa latar belakang. Pada tugas ini digunakan pada tombol registrasi
- Listview.builder : membuat daftar item yang dapat discroll. Pada tugas ini digunakan untuk menampilkan daftar item yang ada.
- Text : membuat teks. Pada tugas ini digunakann untuk menampilkan teks detail saat item pada daftar item ditekan.


**Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).**

**Pada projek Django**
Tambahkan `django-cors-headers` pada `requirements.txt` kemudian jalankan `pip install -r requirements.txt`.

Tambahkan `corsheaders.middleware.CorsMiddleware` pada `settings.py` aplikasi Django serta variabel berikut
```py
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```

Buat app baru bernama `authentication`, pada `urls.py`, buatlah path menuju login, logout, dan register. Jangan lupa hubungkan ke `INSTALLED_APPS` pada `settings.py`.
```py
from django.urls import path
from authentication.views import login, logout, register

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('logout/', logout, name='logout'),
    path('register/', register, name='register'),
]
```

Dan pada `views.py`, buatlah kode berikut:
```py
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import logout as auth_logout
from django.contrib.auth.forms import UserCreationForm

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)

@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)
    
@csrf_exempt
def register(request):
        
    if request.method == "POST":
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return JsonResponse({'message': 'User registered successfully'})
        else:
            return JsonResponse({'errors': form.errors}, status=400)
    return JsonResponse({'message': 'Invalid request'}, status=400)

```
Tambahkan `path('auth/', include('authentication.urls'))`, pada file `inventory_game/urls.py`.

Tambahkan fungsi views baru pada `main/views.py`.
```py
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':
        data = json.loads(request.body)

        new_product = Item.objects.create(
            user = request.user,
            name = data["name"],
            amount = int(data["amount"]),
            description = data["description"]
        )

        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
    
    else:
        return JsonResponse({"status": "error"}, status=401)
```
dan pathnya `path('create-flutter/', create_product_flutter, name='create_product_flutter'),`



**Pada projek Flutter**

Install package yang telah disediakan oleh tim asisten dosen dengan menjalankan perintah berikut di terminal
```bash
flutter pub add provider
flutter pub add pbp_django_auth
```

Buatlah `login.dart` pada folder `screens` yang berisi:
```dart
import 'package:inventory_game/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:inventory_game/screens/register.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

// void main() {
//     runApp(const LoginApp());
// }

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),

                        const SizedBox(height: 12.0),

                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),

                        const SizedBox(height: 24.0),

                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login(
                                  //"http://fredo-melvern-tugas.pbp.cs.ui.ac.id/auth/login/"
                                  "http://127.0.0.1:8000/auth/login/"
                                  , {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),


                        const SizedBox(height: 24.0),


                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => RegistrationPage()),
                                    );
                          },
                          child: const Text("Register"))
                    ],
                ),
            ),
        );
    }
}
```
Jangan lupa arahkan `menu.dart` ke login sebagai halaman yang pertama kali muncul serta menambahkan provider dan CookieRequest.
```dart
class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Flutter App',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                    useMaterial3: true,
                ),
                home: LoginPage()),
            ),
        );
    }
}
```

Kemudian untuk menghandle register, buatlah `register.dart` yang berisi:
```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  //final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _registerUser() async {
    final url = Uri.parse("http://127.0.0.1:8000/auth/register/"
        //"http://fredo-melvern-tugas.pbp.cs.ui.ac.id/auth/register//"
        );
    final response = await http.post(
      url,
      body: {
        'username': _usernameController.text,
        'email': _emailController.text,
        'password1':
            _passwordController.text, // Modify to match Django form fields
        'password2':
            _passwordController.text, // Modify to match Django form fields
      },
    );

    if (response.statusCode == 200) {
      // Handle successful registration
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('User registered successfully.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle registration errors
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to register user.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regisration Form'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 24.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                // String username = _usernameController.text;
                // String password = _passwordController.text;

                await _registerUser();
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

```
Tambahkan kode ini pada `item_card.dart`:
```dart
if (tombol.name == "Tambah Item") {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const InventoryFormPage()));

} else if (tombol.name == "Lihat Item") {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const ItemPage()));
      
}
else if (tombol.name == "Logout") {
  final response = await request.logout(
      //"http://fredo-melvern-tugas.pbp.cs.ui.ac.id/auth/logout/"
      "http://127.0.0.1:8000/auth/logout/"
      );
  String message = response["message"];
  if (response['status']) {
    String uname = response["username"];
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message Sampai jumpa, $uname."),
    ));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message"),
    ));
  }
}
```

Untuk membuta model kustom, buka situs web [QuickType](https://app.quicktype.io/). Copy data JSON pada projek Django dan paste pada textbox pada QuickType. ubah setup name menjadi `Item`, source type `JSON`, dan language `Dart`. Pindahkan hasilnya ke dalam file dart baru `lib/models/product.dart`.

Jalankan `flutter pub add http` pada terinal.

Pada file `android/app/src/main/AndroidManifest.xml`, tambahkan kode berikut untuk memperbolehkan akses internet pada apliaksi Flutter yang dibuat.
```xml
...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
...
```

Pada `list_item.dart`, masukkan kode berikut:
```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inventory_game/models/product.dart';


class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Future<List<Item>> fetchItem() async {
    // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        //'http://fredo-melvern-tugas.pbp.cs.ui.ac.id/json/'
        'http://127.0.0.1:8000/json/'
        //'http://127.0.0.1:8000/get-flutter/'
        );
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Item
    List<Item> listItem = [];
    for (var d in data) {
      if (d != null) {
        listItem.add(Item.fromJson(d));
      }
    }
    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Item'),
        ),
        endDrawer: const RightDrawer(),
        body: FutureBuilder(
            future: fetchItem(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data item.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ListTile(
                            title: Container(
                                      color: const Color(0xFFF7C4A5),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      padding: const EdgeInsets.all(20.0),
                                      
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text(
                                            "${snapshot.data![index].fields.name}",
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          const SizedBox(height: 10),

                                          Text("${snapshot.data![index].fields.amount}"),

                                          const SizedBox(height: 10),

                                          Text("${snapshot.data![index].fields.description}")

                                        ],
                                      ),
                                    ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detail(
                                      pk: snapshot.data![index].pk.toString(),
                                      name: snapshot.data![index].fields.name,
                                      amount: snapshot.data![index].fields.amount.toString(),
                                      description: snapshot.data![index].fields.description,
                                      dateAdded: snapshot.data![index].fields.dateAdded.toString(),
                                    )
                                  )
                                );
                            },
                          ),
                        
                      
                    );
                      
                }
              }
            }));
  }
}
```

Untuk menampilkan detail item saat item diklik, buatlah `detail.dart` yang berisi:
```dart
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String pk;
  final String name;
  final String amount;
  final String description;
  final String dateAdded;

  const Detail(
      {super.key,
      required this.pk,
      required this.name,
      required this.amount,
      required this.description,
      required this.dateAdded});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Item'),
        ),
        //endDrawer: const RightDrawer(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Text("pk: $pk"),

              const SizedBox(height: 20),

              Text("Item amount: $amount"),

              const SizedBox(height: 20),

              Text("Item description: $description"),

              const SizedBox(height: 20),

              Text("Date added: $dateAdded"),
            ],
          ),
          )
          
        ));
  }
}

```

</details>