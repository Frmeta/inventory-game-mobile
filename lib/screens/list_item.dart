import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:inventory_game/models/item.dart';
import 'package:inventory_game/screens/detail.dart';
import 'package:inventory_game/widgets/right_drawer.dart';

class LocalItemPage extends StatefulWidget {
  const LocalItemPage({super.key});

  @override
  State<LocalItemPage> createState() => _LocalItemPageState();
}

class InventoryItem {
  final String name;
  final int amount;
  final String description;

  InventoryItem(this.name, this.amount, this.description);
}

class _LocalItemPageState extends State<LocalItemPage> {
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
                  return OfflineItemCard(inventoryItem);
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OfflineItemCard extends StatelessWidget {
  final InventoryItem inventoryItem;

  const OfflineItemCard(this.inventoryItem, {super.key}); // Constructor

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
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: (){
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detail(
                                name: snapshot.data![index].fields.name,
                                amount: snapshot.data![index].fields.amount.toString(),
                                description: snapshot.data![index].fields.description,
                              ),
                            ));
                        },

                        child: Container(
                            
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
                          )
                      )
                      
                  );
                }
              }
            }));
  }
}
