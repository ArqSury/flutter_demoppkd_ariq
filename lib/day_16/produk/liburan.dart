import 'package:flutter/material.dart';

class LiburanProduk extends StatefulWidget {
  const LiburanProduk({super.key});

  @override
  State<LiburanProduk> createState() => _FashionProdukState();
}

class _FashionProdukState extends State<LiburanProduk> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(leading: Icon(Icons.surfing), title: Text("Surfing")),
          ListTile(leading: Icon(Icons.gamepad), title: Text("Gaming")),
          ListTile(leading: Icon(Icons.cabin), title: Text("Villa")),
          ListTile(
            leading: Icon(Icons.sports_soccer),
            title: Text("Sports Ticket"),
          ),
        ],
      ),
    );
  }
}
