import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tentang Aplikasi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 12,
            children: [
              Text("Tujuan Pembelaran"),
              Text(
                "Peserta mampu membangun aplikasi Flutter dengan navigasi tab bawah (BottomNavigationBar) yang menampilkan 2 tampilan berbeda, dan mengaktifkan drawer hanya pada halaman tertentu.",
              ),
              SizedBox(
                height: 200,
                child: Image(
                  image: AssetImage("assets/images/app1/profil_foto.jpg"),
                ),
              ),
              Text("Creator:"),
              Text("Ariq Surya Wardhana"),
              Text("Mobile Programming"),
              Text("Batch 4"),
              Text("PPKD Jakarta Pusat"),
            ],
          ),
        ),
      ),
    );
  }
}
