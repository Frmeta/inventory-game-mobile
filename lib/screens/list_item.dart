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
