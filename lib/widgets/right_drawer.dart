import 'package:flutter/material.dart';
import 'package:inventory_game/screens/form.dart';
import 'package:inventory_game/screens/list_item.dart';
import 'package:inventory_game/screens/menu.dart';

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
                    builder: (context) => const ItemPage(),
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
