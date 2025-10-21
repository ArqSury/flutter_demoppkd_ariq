import 'package:flutter/material.dart';

class MakananProduk extends StatefulWidget {
  const MakananProduk({super.key});

  @override
  State<MakananProduk> createState() => _MakananProdukState();
}

class _MakananProdukState extends State<MakananProduk> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(leading: Icon(Icons.fastfood), title: Text("Burger & Cola")),
          ListTile(leading: Icon(Icons.cake), title: Text("Kue")),
          ListTile(leading: Icon(Icons.water_drop), title: Text("Minuman")),
          ListTile(leading: Icon(Icons.icecream), title: Text("Ice Cream")),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("Paket Makanan"),
          ),
        ],
      ),
    );
  }
}
