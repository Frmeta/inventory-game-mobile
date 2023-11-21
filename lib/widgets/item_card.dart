
import 'package:flutter/material.dart';
import 'package:inventory_game/screens/form.dart';
import 'package:inventory_game/screens/list_item.dart';
import 'package:inventory_game/screens/login.dart';
import 'package:inventory_game/screens/menu.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ItemCard extends StatelessWidget {
  final Tombol tombol;

  const ItemCard(this.tombol, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Material(
      color: tombol.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(SnackBar(
          //       content: Text("Kamu telah menekan tombol ${tombol.name}!")));

          // Pindah halaman
          if (tombol.name == "Tambah Item") {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const InventoryFormPage()));

          } else if (tombol.name == "Lihat Item") {
            // tanpa database
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const ListItemPage()));
          
            // dengan database
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const ItemPage()));
                
          } else if (tombol.name == "Logout") {
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
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  tombol.icon,
                  color: Colors.white,
                  size: 30,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  tombol.name,
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