import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_13/reuse/account.dart';
import 'package:flutter_demoppkd_ariq/day_13/reuse/input_user.dart';
import 'package:flutter_demoppkd_ariq/day_15/routing.dart';

class Tugas6Flutter extends StatefulWidget {
  const Tugas6Flutter({super.key});

  @override
  State<Tugas6Flutter> createState() => _Tugas6FlutterState();
}

class _Tugas6FlutterState extends State<Tugas6Flutter> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/tugas_6flutter/smile.png"),
                ),
              ),
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Text(
                "Welcome back!",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(12),
                  child: UserInputWidget(hint: "Email"),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: UserInputWidget(hint: "Password", isPassword: true),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    debugPrint("Ganti Password");
                    setState(() {});
                  },
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(360, 60),
                backgroundColor: Colors.blue,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoutingWidget()),
                );
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Expanded(child: Divider(thickness: 1)),
                Text("or"),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                AccountWidget(
                  image: "assets/images/tugas_6flutter/facebook.jpg",
                ),
                AccountWidget(image: "assets/images/tugas_6flutter/google.png"),
                AccountWidget(image: "assets/images/tugas_6flutter/apple.png"),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    debugPrint("Sign Up");
                    setState(() {});
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
