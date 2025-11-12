import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_32/views/home_screen32.dart';

class SplashScreen32 extends StatefulWidget {
  const SplashScreen32({super.key});

  @override
  State<SplashScreen32> createState() => _SplashScreen32State();
}

class _SplashScreen32State extends State<SplashScreen32> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() async {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen32()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/day_32/hogwarts_bg.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/images/day_32/logo_tugas14.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
