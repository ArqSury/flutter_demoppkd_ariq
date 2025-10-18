import 'package:flutter/material.dart';

class Tugas4FlutterWidget extends StatelessWidget {
  const Tugas4FlutterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 4"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(8),
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "Formulir Pengguna",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Text("Nama:"),
          Container(
            color: Colors.white,
            height: 48,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukan Nama Anda",
              ),
            ),
          ),
          SizedBox(height: 4),
          Text("Email:"),
          Container(
            color: Colors.white,
            height: 48,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukan Email Anda",
              ),
            ),
          ),
          SizedBox(height: 4),
          Text("No. HP:"),
          Container(
            color: Colors.white,
            height: 48,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukan No. HP Anda",
              ),
            ),
          ),
          SizedBox(height: 4),
          Text("Email:"),
          Container(
            color: Colors.white,
            height: 48,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Masukan Deskripsi",
              ),
            ),
          ),
          SizedBox(height: 4),
          Divider(height: 20),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Daftar Produk",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(8),
            leading: Image.asset(
              "assets/images/tugas_4flutter/CPU_1.jpg",
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
            title: Text(
              "CPU",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Rp. 5.000.000,-", style: TextStyle(fontSize: 12)),
            trailing: Icon(Icons.more_horiz),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(8),
            leading: Image.asset(
              "assets/images/tugas_4flutter/Monitor.png",
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
            title: Text(
              "Monitor",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Rp. 4.000.000,-", style: TextStyle(fontSize: 12)),
            trailing: Icon(Icons.more_horiz),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(8),
            leading: Image.asset(
              "assets/images/tugas_4flutter/Mouse.jpg",
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
            title: Text(
              "Mouse",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Rp. 500.000,-", style: TextStyle(fontSize: 12)),
            trailing: Icon(Icons.more_horiz),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(8),
            leading: Image.asset(
              "assets/images/tugas_4flutter/keyboard.jpg",
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
            title: Text(
              "Keyboard",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Rp. 1.500.000,-", style: TextStyle(fontSize: 12)),
            trailing: Icon(Icons.more_horiz),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(8),
            leading: Image.asset(
              "assets/images/tugas_4flutter/Headset.jpg",
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
            title: Text(
              "Headset",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Rp. 500.000,-", style: TextStyle(fontSize: 12)),
            trailing: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
