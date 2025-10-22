import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/constant/tugas_9/app_image.dart';
import 'package:flutter_demoppkd_ariq/day_17/model_pakaian.dart';

class TugasModel extends StatefulWidget {
  const TugasModel({super.key});

  @override
  State<TugasModel> createState() => _TugasModelState();
}

class _TugasModelState extends State<TugasModel> {
  final List<ModelPakaian> namaListPakaian = [
    ModelPakaian(name: "Kemeja Santai", stock: 100, image: AppImage.kemeja),
    ModelPakaian(name: "Kemeja Batik", stock: 50, image: AppImage.batik),
    ModelPakaian(name: "Baju Jersey", stock: 36, image: AppImage.jersey),
    ModelPakaian(name: "Celana Santai", stock: 120, image: AppImage.celana),
    ModelPakaian(name: "Celana olahraga", stock: 160, image: AppImage.olahraga),
    ModelPakaian(name: "Sepatu Pantofel", stock: 20, image: AppImage.pantofel),
    ModelPakaian(name: "Spatu Lari", stock: 5, image: AppImage.running),
    ModelPakaian(name: "Topi", stock: 100, image: AppImage.topi),
    ModelPakaian(name: "Jam Tangan", stock: 10, image: AppImage.jam),
    ModelPakaian(name: "Gesper", stock: 40, image: AppImage.gesper),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Model", style: TextStyle(fontStyle: FontStyle.italic)),
      ),
    );
  }
}
