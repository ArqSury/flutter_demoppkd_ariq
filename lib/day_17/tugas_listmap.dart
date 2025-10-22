import 'package:flutter/material.dart';

class TugasListmap extends StatefulWidget {
  const TugasListmap({super.key});

  @override
  State<TugasListmap> createState() => _TugasListmapState();
}

class _TugasListmapState extends State<TugasListmap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List")),
      body: Expanded(child: Container(color: Colors.red)),
    );
  }
}
