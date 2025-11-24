import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_33/model/login_model.dart';
import 'package:flutter_demoppkd_ariq/day_39/services/firebase_service.dart';
import 'package:flutter_demoppkd_ariq/day_39/views/main_fire.dart';
import 'package:flutter_demoppkd_ariq/day_39/views/regis_fire.dart';
import 'package:flutter_demoppkd_ariq/shared_preferences/preferences_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginFire extends StatefulWidget {
  const LoginFire({super.key});

  @override
  State<LoginFire> createState() => _LoginFireState();
}

class _LoginFireState extends State<LoginFire> {
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  bool isVisiblity = false;
  bool isLoading = false;

  LoginModel? loginResult;

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
          child: SingleChildScrollView(
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
                SizedBox(height: 20),
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
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Kata sandi tidak boleh kosong";
                    } else if (value.length < 8) {
                      return "Kata sandi minimal 8 karakter";
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
                        final data = await FirebaseService.loginUser(
                          email: emailC.text,
                          password: passwordC.text,
                        );
                        PreferencesHandler.saveLogin(true);

                        if (data != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => MainFire()),
                          );
                          Fluttertoast.showToast(msg: "Login Berhasil");
                        } else {
                          Fluttertoast.showToast(
                            msg: 'Email atau Kata sandi salah',
                          );
                        }
                      } catch (e) {
                        print(e.toString());
                        Fluttertoast.showToast(msg: e.toString());
                        setState(() {
                          isLoading = false;
                        });
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Validasi Error'),
                            content: Text('Isi semua data Anda!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Kembali',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
                SizedBox(height: 32),
                Divider(color: Colors.black),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum punya akun?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisFire()),
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
