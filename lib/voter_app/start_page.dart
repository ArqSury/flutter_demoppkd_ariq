import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  const StartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.white],
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/voter_app/logo_voterson_nobg2.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
