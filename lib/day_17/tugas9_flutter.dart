import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_17/tugas_list.dart';
import 'package:flutter_demoppkd_ariq/day_17/tugas_listmap.dart';
import 'package:flutter_demoppkd_ariq/day_17/tugas_model.dart';

class Tugas9Flutter extends StatefulWidget {
  const Tugas9Flutter({super.key});

  @override
  State<Tugas9Flutter> createState() => _Tugas9FlutterState();
}

class _Tugas9FlutterState extends State<Tugas9Flutter> {
  int _selectedDrawer = 0;
  static const List<Widget> _widgetOption = [
    TugasList(),
    TugasListmap(),
    TugasModel(),
  ];
  void onTapDrawer(int index) {
    setState(() {
      _selectedDrawer = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas 9 Flutter"), centerTitle: true),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/app1/profil_foto.jpg",
                ),
              ),
              title: Text("Ariq Surya Wardhana"),
              subtitle: Text("Tugas 9 Flutter"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewList Widget"),
            ),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.map),
              title: Text("ListViewListMap Widget"),
            ),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.model_training),
              title: Text("ListViewModel Widget"),
            ),
          ],
        ),
      ),
      body: _widgetOption[_selectedDrawer],
    );
  }
}
