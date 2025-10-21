import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_15/app1/profilpage.dart';
import 'package:flutter_demoppkd_ariq/day_15/app1/widget/button_widget.dart';
import 'package:flutter_demoppkd_ariq/day_15/app1/widget/news.dart';

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
      body: ListView(
        children: [
          Column(
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
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text("Berita Hari Ini", style: TextStyle(fontSize: 20)),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    NewsWidget(
                      news: Icons.schedule,
                      newstitle: "Perubahan Jadwal",
                      newsdate: "2 Juni 2025",
                    ),
                    NewsWidget(
                      news: Icons.task,
                      newstitle: "Tugas Baru",
                      newsdate: "6 Juni 2025",
                    ),
                    NewsWidget(
                      news: Icons.celebration,
                      newstitle: "Penghargaan",
                      newsdate: "20 Juni 2025",
                    ),
                    NewsWidget(
                      news: Icons.person,
                      newstitle: "Murid Baru",
                      newsdate: "21 Juni 2025",
                    ),
                    NewsWidget(
                      news: Icons.favorite,
                      newstitle: "Cinta Lokasi",
                      newsdate: "30 Juni 2025",
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(8),
                height: 200,
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [BoxShadow(blurRadius: 8)],
                  color: Colors.brown,
                ),
                child: Column(
                  spacing: 8,
                  children: [
                    Padding(padding: const EdgeInsets.all(4)),
                    Text(
                      "Anda Belum Absen",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("*Klik 'Absensi' untuk Absen*"),
                    SizedBox(height: 10),
                    ButtonFunction(
                      button: "ABSENSI",
                      height: 50,
                      widht: 50,
                      buttoncolor: 0xFFFFFFFF,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
