import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_33/views/login33.dart';

class Splash33 extends StatefulWidget {
  const Splash33({super.key});

  @override
  State<Splash33> createState() => _Splash33State();
}

class _Splash33State extends State<Splash33> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  isLogin() async {
    Future.delayed(Duration(seconds: 5)).then((value) async {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login33()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/app1/profil_foto.jpg'),
                height: 200,
                width: 200,
              ),
              SizedBox(height: 20),
              Text(
                'SEKIP APP',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times New Roman',
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
