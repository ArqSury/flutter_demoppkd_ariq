import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/voter_app/functions/buttoninput.dart';
import 'package:flutter_demoppkd_ariq/voter_app/functions/userinput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 829,
                  width: double.infinity,
                  color: Colors.red,
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  height: 740,
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [BoxShadow(blurRadius: 12, color: Colors.black)],
                  ),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          "assets/images/voter_app/logoapp_final.png",
                        ),
                        height: 180,
                        width: 180,
                      ),
                      Text(
                        "Selamat Datang!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times New Roman",
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.all(12),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nama:", style: TextStyle(fontSize: 16)),
                            Container(
                              margin: EdgeInsets.all(8),
                              height: 48,
                              width: double.infinity,
                              child: Userinput(hint: "Masukan Nama"),
                            ),
                            Text("ID:", style: TextStyle(fontSize: 16)),
                            Container(
                              margin: EdgeInsets.all(8),
                              height: 48,
                              width: double.infinity,
                              child: Userinput(hint: "Sesuai KTP"),
                            ),
                            Text("Password:", style: TextStyle(fontSize: 16)),
                            Container(
                              margin: EdgeInsets.all(8),
                              height: 48,
                              width: double.infinity,
                              child: Userinput(
                                hint: "Minimal 8 karakter",
                                isPassword: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 60),
                      Buttoninput(
                        button: "MASUK",
                        tinggi: 50,
                        lebar: 40,
                        backgroundColor: Colors.red,
                        color: Colors.white,
                        press: () {
                          debugPrint("Masuk");
                          setState(() {});
                        },
                      ),
                    ],
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
