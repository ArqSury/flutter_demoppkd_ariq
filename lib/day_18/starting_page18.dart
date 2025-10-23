import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_17/tugas9_flutter.dart';
import 'package:flutter_demoppkd_ariq/day_18/login_screen18.dart';
import 'package:flutter_demoppkd_ariq/shared_preferences/preferences_handler.dart';

class StartingPage18 extends StatefulWidget {
  const StartingPage18({super.key});

  @override
  State<StartingPage18> createState() => _StartingPage18State();
}

class _StartingPage18State extends State<StartingPage18> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() async {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var isLogin = await PreferencesHandler.getLogin();
      print(isLogin);
      if (isLogin != null && isLogin == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Tugas9Flutter()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen18()),
          (route) => false,
        );
      }
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
