import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_15/app1/profilpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _selectdrawer = 0;
  // static const List<Widget> _drawerOption = [ProfilPage(), JadwalKelas()];
  void onTapDrawer(int drawer) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilPage()),
    );

    // setState(() {
    //   // _selectdrawer = drawer;

    // });
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App 1", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
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
              title: Text("Ariq Surya W."),
              subtitle: Text("Peserta PPKD"),
            ),
            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.person),
              title: Text("Profil Anda"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.calendar_month_outlined),
              title: Text("Jadwal Kelas"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.school_rounded),
              title: Text("Ujian"),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "Halo, Ariq Surya Wardhana!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
