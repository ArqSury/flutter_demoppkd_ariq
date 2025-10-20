import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_12/tugas5_flutter.dart';
import 'package:flutter_demoppkd_ariq/day_13/reuse/widget.dart';
import 'package:flutter_demoppkd_ariq/day_15/end.dart';

class RoutingWidget extends StatefulWidget {
  const RoutingWidget({super.key});

  @override
  State<RoutingWidget> createState() => _RoutingWidgetState();
}

class _RoutingWidgetState extends State<RoutingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Routing"), backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              child: ButtonWidget(
                button: "Log Out",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: ButtonWidget(
                button: "Go to Day 12",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Tugas5Flutter()),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              child: ButtonWidget(
                button: "The End",
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => EndWidget()),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
