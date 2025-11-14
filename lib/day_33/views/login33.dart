import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_33/service/api.dart';
import 'package:flutter_demoppkd_ariq/day_33/views/main33.dart';
import 'package:flutter_demoppkd_ariq/day_33/views/regis33.dart';
import 'package:flutter_demoppkd_ariq/shared_preferences/preferences_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login33 extends StatefulWidget {
  const Login33({super.key});

  @override
  State<Login33> createState() => _Login33State();
}

class _Login33State extends State<Login33> {
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  bool isVisiblity = false;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [buildBackground(), buildLayer()],
        ),
      ),
    );
  }

  Widget buildLayer() {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 12)],
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 12),
              Text(
                'Selamat Datang',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.black, endIndent: 32, indent: 32),
              Text(
                'Isi biodata anda',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
              ),
              SizedBox(height: 32),
              buildInputUser(
                hintText: 'Masukan email anda',
                controller: emailC,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email tidak boleh kosong";
                  } else if (!value.contains('@')) {
                    return "Email tidak valid";
                  }
                  return null;
                },
              ),
              buildInputUser(
                hintText: 'Masukan kata sandi anda',
                controller: passwordC,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email tidak boleh kosong";
                  } else if (value.length < 6) {
                    return "Password minimal 6 karakter";
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              buildButton(
                text: 'MASUK',
                color: Colors.black,
                height: 60,
                widht: 120,
                backgroundColor: Colors.blue,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      final result = await AuthAPI.loginUser(
                        email: emailC.text,
                        password: passwordC.text,
                      );

                      await PreferencesHandler.saveToken(result.data!.token!);
                      Fluttertoast.showToast(msg: "Login Berhasil");

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => Main33()),
                      );
                    } catch (e) {
                      print(e.toString());
                      Fluttertoast.showToast(msg: e.toString());
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 48),
              Divider(color: Colors.black),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Belum punya akun?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Regis33()),
                      );
                    },
                    child: Text('Daftar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton({
    String? text,
    Color? color,
    Color? backgroundColor,
    void Function()? onPressed,
    double? elevation,
    double? height,
    double? widht,
  }) {
    return SizedBox(
      height: height,
      width: widht,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          backgroundColor: backgroundColor,
          elevation: 8,
        ),
        onPressed: onPressed,
        child: Text('$text', style: TextStyle(color: color)),
      ),
    );
  }

  Widget buildInputUser({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: isPassword ? isVisiblity : false,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isVisiblity = !isVisiblity;
                    });
                  },
                  icon: Icon(
                    isVisiblity ? Icons.visibility_off : Icons.visibility,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
    );
  }
}
