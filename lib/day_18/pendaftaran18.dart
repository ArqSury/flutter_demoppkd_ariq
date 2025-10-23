import 'package:flutter/material.dart';

class Pendaftaran18 extends StatefulWidget {
  const Pendaftaran18({super.key, required this.name, required this.kota});
  final String name;
  final String kota;
  @override
  State<Pendaftaran18> createState() => _Pendaftaran18State();
}

class _Pendaftaran18State extends State<Pendaftaran18> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '"Terima Kasih\n ${widget.name}\n dari\n ${widget.kota}\n telah mendaftar"',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Times New Roman",
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
