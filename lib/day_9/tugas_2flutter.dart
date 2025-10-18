import 'package:flutter/material.dart';

class Tugas2FlutterWidget extends StatelessWidget {
  const Tugas2FlutterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Lengkap"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          Text(
            "ARIQ SURYA WARDHANA",
            style: TextStyle(
              fontSize: 26,
              color: Colors.brown,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(padding: const EdgeInsets.all(8)),
          Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 8),
                Text("Ariqsurya0510@gmail.com", style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(8)),
          Row(children: [Icon(Icons.phone), Text("081289438280"), Spacer()]),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(children: [Text("Postingan")]),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(children: [Text("Followers")]),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  "Deskripsi",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Graduate from Math & Science studies of SMAN 68 Jakarta. Actively participated in organizational activities during schools and able to work in a team or individually. Has work experience in the field of marketing and building relationships with clients. Expertise in communication and coordination is very helpful to achieve marketing targets. Always active in learning new tools to support and achieve success in work.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(child: Container(color: Colors.white)),
          Container(
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Colors.greenAccent,
                  Colors.lightGreen,
                  Colors.lightGreenAccent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
