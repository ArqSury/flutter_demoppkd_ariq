import 'package:flutter/material.dart';

class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Tugas5Flutter> {
  bool showName = false;
  bool showFavorite = false;
  bool showDeskripsi = false;
  bool showBox = false;
  int counter = 0;
  int gesture = 0;
  var name = "Ariq Surya Wardhana";
  var desc =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";
  var box = "Terima kasih sudah mengunjungi!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 5 Flutter"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter--;
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 4)],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  showName
                      ? Text(
                          " $name ",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          "*****",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                      showName = !showName;
                    },
                    child: Text("Tampilkan Nama"),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.all(8),
              child: IconButton(
                onPressed: () {
                  setState(() {});
                  showFavorite = !showFavorite;
                },
                icon: Icon(
                  showFavorite ? Icons.favorite : Icons.favorite,
                  color: showFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ),
            Text(showFavorite ? "Disukai" : ""),
            Divider(height: 20),
            Container(
              height: 360,
              width: double.infinity,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 4)],
              ),
              child: Column(
                children: [
                  showDeskripsi
                      ? Text(
                          " $desc ",
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      : Text(
                          " $desc ",
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.blueGrey,
                          ),
                        ),
                  TextButton(
                    onPressed: () {
                      setState(() {});
                      showDeskripsi = !showDeskripsi;
                    },
                    child: Text(
                      "Lihat Selengkapnya",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 120,
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 4)],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      debugPrint("Ditekan Sekali");
                      gesture++;
                      setState(() {});
                    },
                    onDoubleTap: () {
                      debugPrint("Ditekan Dua Kali");
                      gesture += 2;
                      setState(() {});
                    },
                    onLongPress: () {
                      debugPrint("Tahan Lama");
                      gesture += 3;
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        Text(
                          "Tekan Aku!",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          gesture.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 120,
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 4)],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Counter",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        counter.toStringAsFixed(0),
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 120,
              width: double.infinity,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 4)],
              ),
              child: InkWell(
                splashColor: Colors.white,
                onTap: () {
                  debugPrint("Kotak disentuh");
                  showBox = !showBox;
                  setState(() {});
                },
              ),
            ),
            if (showBox)
              Text(" $box ", style: TextStyle(fontSize: 16, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
