import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_16/drawer/kategori_produk.dart';
import 'package:flutter_demoppkd_ariq/day_16/drawer/pengingat_waktu.dart';
import 'package:flutter_demoppkd_ariq/day_16/drawer/switch_background.dart';
import 'package:flutter_demoppkd_ariq/day_16/drawer/syarat_dan_ketentuan.dart';
import 'package:flutter_demoppkd_ariq/day_16/drawer/tanggal_lahir.dart';

class Tugas7Flutter extends StatefulWidget {
  const Tugas7Flutter({super.key});

  @override
  State<Tugas7Flutter> createState() => _Tugas7FlutterState();
}

class _Tugas7FlutterState extends State<Tugas7Flutter> {
  int _selectedindex = 0;
  static const List<Widget> _widgetOptions = [
    SyaratKetentuan(),
    BackgroundSwitch(),
    ProdukKategori(),
    TanggalLahir(),
    AturPengingat(),
  ];
  void onTapDrawer(int index) {
    setState(() {
      _selectedindex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 7 Flutter"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
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
              subtitle: Text(
                "Mobile Programming\n"
                "PPKD Jakarta Pusat\n"
                "Batch 4",
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.check_box),
              title: Text("Syarat dan Ketentuan"),
            ),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.swap_horiz),
              title: Text("Ganti Background"),
            ),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.shopping_cart),
              title: Text("Produk"),
            ),
            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              leading: Icon(Icons.calendar_today),
              title: Text("Tanggal Lahir"),
            ),
            ListTile(
              onTap: () {
                onTapDrawer(4);
              },
              leading: Icon(Icons.alarm),
              title: Text("Atur Pengingat"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedindex],
    );
  }
}
