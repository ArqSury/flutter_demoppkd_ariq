import 'package:flutter/material.dart';

class ScaffoldWidgetDay7 extends StatelessWidget {
  const ScaffoldWidgetDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile Saya"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ARIQ SURYA WARDHANA", style: TextStyle(fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                Text(
                  "Jakarta",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ],
            ),
            Text(
              "Saya pelajar yang sedang belajar Flutter",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
