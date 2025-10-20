import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_13/reuse/input_user.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            color: Colors.red,
            height: double.infinity,
            width: double.infinity,
          ),
          Stack(
            clipBehavior: Clip.antiAlias,
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                height: 680,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 120),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        "Nama:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: UserInputWidget(hint: "Masukan Nama"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        "No. HP:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: UserInputWidget(hint: "Masukan No. HP"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        "Password:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: UserInputWidget(
                        hint: "Minimal 8 karakter",
                        isPassword: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: -86,
            child: Container(
              margin: EdgeInsets.all(8),
              child: Image(
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
