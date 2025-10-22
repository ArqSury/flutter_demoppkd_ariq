import 'package:flutter/material.dart';

class TugasList extends StatefulWidget {
  const TugasList({super.key});

  @override
  State<TugasList> createState() => _TugasListState();
}

class _TugasListState extends State<TugasList> {
  final List<String> namaPakaian = [
    "Kemeja Santai",
    "Kemeja Batik",
    "Baju Jersey",
    "Celana Santai",
    "Celana Olahraga",
    "Sepatu Pantofel",
    "Sepatu Lari",
    "Jam Tangan",
    "Topi",
    "Gesper",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List", style: TextStyle(fontStyle: FontStyle.italic)),
      ),
      body: ListView.builder(
        itemCount: namaPakaian.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(namaPakaian[index], style: TextStyle(fontSize: 20)),
          );
        },
      ),
    );
  }
}
