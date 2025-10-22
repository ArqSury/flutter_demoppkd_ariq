import 'package:flutter/material.dart';

class TugasListmap extends StatefulWidget {
  const TugasListmap({super.key});

  @override
  State<TugasListmap> createState() => _TugasListmapState();
}

class _TugasListmapState extends State<TugasListmap> {
  final List<Map<String, dynamic>> namaPakaianList = [
    {"name": "Kemeja Santai", "icon": Icons.person},
    {"name": "Kemeja Batik", "icon": Icons.cloud},
    {"name": "Baju Jersey", "icon": Icons.sports_soccer},
    {"name": "Celana Santai", "icon": Icons.airline_seat_legroom_normal},
    {"name": "Celana Olahraga", "icon": Icons.airline_seat_legroom_extra},
    {"name": "Sepatu Pantofel", "icon": Icons.do_not_step},
    {"name": "Sepatu Lari", "icon": Icons.run_circle_outlined},
    {"name": "Jam Tangan", "icon": Icons.watch},
    {"name": "Topi", "icon": Icons.headset},
    {"name": "Gesper", "icon": Icons.loop},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List<Map>", style: TextStyle(fontStyle: FontStyle.italic)),
      ),
      body: ListView.builder(
        itemCount: namaPakaianList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = namaPakaianList[index];
          return ListTile(
            leading: Icon(item["icon"]),
            title: Text(item["name"]),
          );
        },
      ),
    );
  }
}
