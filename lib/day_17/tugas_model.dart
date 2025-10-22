import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_17/model_pakaian.dart';

class TugasModel extends StatefulWidget {
  const TugasModel({super.key});

  @override
  State<TugasModel> createState() => _TugasModelState();
}

class _TugasModelState extends State<TugasModel> {
  final List<ModelPakaian> namaListPakaian = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Model", style: TextStyle(fontStyle: FontStyle.italic)),
      ),
    );
  }
}
