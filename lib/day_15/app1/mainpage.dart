import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_15/app1/widget/button_widget.dart';
import 'package:flutter_demoppkd_ariq/day_15/app1/widget/news.dart';

class MAinPage extends StatefulWidget {
  const MAinPage({super.key});

  @override
  State<MAinPage> createState() => _MAinPageState();
}

class _MAinPageState extends State<MAinPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  ButtonFunction(
                    button: "ABSENSI",
                    press: () {
                      debugPrint("Absen");
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
