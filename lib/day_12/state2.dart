import 'package:flutter/material.dart';

class Lesson2Day12 extends StatefulWidget {
  const Lesson2Day12({super.key});

  @override
  State<Lesson2Day12> createState() => _Lesson2Day12State();
}

class _Lesson2Day12State extends State<Lesson2Day12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lesson 2"),
        backgroundColor: Colors.lightGreenAccent,
        centerTitle: true,
      ),
    );
  }
}
