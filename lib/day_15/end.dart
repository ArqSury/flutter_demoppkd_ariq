import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_13/tugas6_flutter.dart';

class EndWidget extends StatefulWidget {
  const EndWidget({super.key});

  @override
  State<EndWidget> createState() => _EndWidgetState();
}

class _EndWidgetState extends State<EndWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Tugas6Flutter()),
            );
          },
          child: Text("Back to Start"),
        ),
      ),
    );
  }
}
