import 'package:flutter/material.dart';
import 'package:inventory_game/screens/form.dart';
import 'package:inventory_game/screens/list_item.dart';
import 'package:inventory_game/widgets/right_drawer.dart';
import 'dart:math' as math;

class Item {
  final String name;
  final IconData icon;
  final Color color;

  Item(this.name, this.icon, this.color);
}

class ItemDisplay {
  final IconData icon;

  ItemDisplay(this.icon);
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Item> items = [
    Item("Lihat Item", Icons.description, const Color(0xFF9E7682)),
    Item("Tambah Item", Icons.note_add, const Color(0xFF6F5770)),
    Item("Logout", Icons.logout, const Color(0xFF4D4861)),
  ];

  final List<ItemDisplay> itemDisplays = [
    ItemDisplay(Icons.fingerprint),
    ItemDisplay(Icons.lock),
    ItemDisplay(Icons.tablet_android),
    ItemDisplay(Icons.build),
    ItemDisplay(Icons.explore),
    ItemDisplay(Icons.bug_report),
    ItemDisplay(Icons.extension),
    ItemDisplay(Icons.shop),
    ItemDisplay(Icons.anchor),
    ItemDisplay(Icons.monitor),
    ItemDisplay(Icons.image),
    ItemDisplay(Icons.straighten),
    ItemDisplay(Icons.toys),
    ItemDisplay(Icons.watch),
    ItemDisplay(Icons.menu_book),
    ItemDisplay(Icons.local_cafe),
    ItemDisplay(Icons.fastfood),
    ItemDisplay(Icons.local_post_office),
    ItemDisplay(Icons.diamond),
    ItemDisplay(Icons.set_meal),
    ItemDisplay(Icons.medication),
    ItemDisplay(Icons.cable),
    ItemDisplay(Icons.umbrella),
    ItemDisplay(Icons.sports_bar),
    ItemDisplay(Icons.casino),
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
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 40.0, bottom: 0.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Inventory Game', // Text yang menandakan nama game
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // hiasan
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    color: const Color(0xFF605070),
                    padding: const EdgeInsets.all(5),
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: GridView.count(
                      primary: false,
                      crossAxisCount: 5,
                      shrinkWrap: true,
                      children: itemDisplays.map((ItemDisplay itemDisplay) {
                        // Iterasi untuk setiap item
                        return ItemDisplayCard(itemDisplay);
                      }).toList(),
                    )),
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
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
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
                  size: 30,
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

class ItemDisplayCard extends StatelessWidget {
  final ItemDisplay itemDisplay;

  const ItemDisplayCard(this.itemDisplay, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: //itemDisplay.color,
          Color(0x7F7F7F +
                  (math.Random().nextDouble() * 0x80).toInt() +
                  (math.Random().nextDouble() * 0x80).toInt() * 16 * 16 +
                  (math.Random().nextDouble() * 0x80).toInt() *
                      16 *
                      16 *
                      16 *
                      16)
              .withOpacity(1.0),
      child: Center(
        child: Icon(
          itemDisplay.icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

class InventoryItem {
  final String name;
  final int amount;
  final String description;

  InventoryItem(this.name, this.amount, this.description);
}
