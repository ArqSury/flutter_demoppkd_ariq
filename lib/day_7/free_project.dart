import 'package:flutter/material.dart';

class LayarDepanWidget extends StatelessWidget {
  const LayarDepanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 189, 144, 128),
      appBar: AppBar(
        title: Text("Hikayat", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text("Hikayat", style: TextStyle(color: Colors.red, fontSize: 70)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("ver 3.5.0", style: TextStyle(fontSize: 10))],
            ),
            Text("Tekan Layar Untuk Lanjut", style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
