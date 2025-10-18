import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(color: Colors.red, height: 840, width: 500),
            Positioned(
              bottom: 40,
              child: Container(
                height: 700,
                width: 340,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
