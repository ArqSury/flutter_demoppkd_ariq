import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Peserta"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                boxShadow: [BoxShadow(blurRadius: 16, color: Colors.black)],
              ),
              child: Image(
                image: AssetImage("assets/images/app1/profil_foto.jpg"),
              ),
            ),
            Text(
              "Ariq Surya Wardhana",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Icon(Icons.email),
                      Text("ariqsurya0510@gmail.com"),
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [Icon(Icons.phone), Text("081289438280")],
                  ),
                ],
              ),
            ),
            Container(
              height: 360,
              width: double.infinity,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Text("Masukan Deskripsi"),
            ),
          ],
        ),
      ),
    );
  }
}
