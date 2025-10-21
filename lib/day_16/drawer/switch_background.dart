import 'package:flutter/material.dart';

class BackgroundSwitch extends StatefulWidget {
  const BackgroundSwitch({super.key});

  @override
  State<BackgroundSwitch> createState() => _BackgroundSwitchState();
}

class _BackgroundSwitchState extends State<BackgroundSwitch> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              color: isSwitched ? Colors.black : Colors.white,
              child: Column(
                children: [
                  Text(
                    "Ganti Background",
                    style: TextStyle(
                      color: isSwitched ? Colors.white : Colors.black,
                    ),
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                  Text(
                    isSwitched ? "Mode Gelap" : "Mode Terang",
                    style: TextStyle(
                      color: isSwitched ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
