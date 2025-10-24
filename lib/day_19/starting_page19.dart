import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_17/tugas9_flutter.dart';

class StartingPage19 extends StatefulWidget {
  const StartingPage19({super.key});

  @override
  State<StartingPage19> createState() => _StartingPage19State();
}

class _StartingPage19State extends State<StartingPage19> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Tugas9Flutter()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.white],
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                  ),
                ),
                child: Image(
                  image: AssetImage(
                    "assets/images/voter_app/logo_voterson_nobg2.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
