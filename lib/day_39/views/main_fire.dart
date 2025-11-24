import 'package:flutter/material.dart';

class MainFire extends StatefulWidget {
  const MainFire({super.key});

  @override
  State<MainFire> createState() => _MainFireState();
}

class _MainFireState extends State<MainFire> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Hello World!')],
          ),
        ),
      ),
    );
  }
}
