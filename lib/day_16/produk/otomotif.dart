import 'package:flutter/material.dart';

class OtomotifProduk extends StatefulWidget {
  const OtomotifProduk({super.key});

  @override
  State<OtomotifProduk> createState() => _OtomotifProdukState();
}

class _OtomotifProdukState extends State<OtomotifProduk> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(leading: Icon(Icons.local_shipping), title: Text("Truk")),
          ListTile(leading: Icon(Icons.bike_scooter), title: Text("Motor")),
          ListTile(
            leading: Icon(Icons.directions_boat),
            title: Text("Kapal Laut"),
          ),
          ListTile(
            leading: Icon(Icons.airplanemode_active),
            title: Text("Pesawat"),
          ),
          ListTile(leading: Icon(Icons.no_crash_rounded), title: Text("Mobil")),
        ],
      ),
    );
  }
}
