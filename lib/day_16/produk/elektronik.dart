import 'package:flutter/material.dart';

class ElektronikProduk extends StatefulWidget {
  const ElektronikProduk({super.key});

  @override
  State<ElektronikProduk> createState() => _ElektronikProdukState();
}

class _ElektronikProdukState extends State<ElektronikProduk> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(leading: Icon(Icons.monitor), title: Text("Monitor")),
          ListTile(leading: Icon(Icons.mouse), title: Text("Mouse")),
          ListTile(leading: Icon(Icons.keyboard), title: Text("Keyboard")),
          ListTile(leading: Icon(Icons.speaker), title: Text("Speaker")),
          ListTile(leading: Icon(Icons.headset), title: Text("Headset")),
        ],
      ),
    );
  }
}
