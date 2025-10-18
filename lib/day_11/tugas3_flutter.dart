import 'package:flutter/material.dart';

class Tugas3FlutterWidget extends StatelessWidget {
  const Tugas3FlutterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas 3"), backgroundColor: Colors.grey),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Galeri Grid",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 300,
                          width: 300,
                          color: Colors.blueGrey,
                        ),
                        Text("Label"),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
