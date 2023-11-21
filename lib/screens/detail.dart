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
