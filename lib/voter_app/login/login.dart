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
          Container(color: Colors.red, height: 840, width: 500),
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
                  boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [SizedBox(height: 120), Text("Nama:")],
                ),
              ),
            ],
          ),
          Positioned(
            top: -88,
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
