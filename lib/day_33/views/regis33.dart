import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_33/model/register_model.dart';
import 'package:flutter_demoppkd_ariq/day_33/service/api.dart';
import 'package:flutter_demoppkd_ariq/day_33/views/login33.dart';
import 'package:flutter_demoppkd_ariq/shared_preferences/preferences_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Regis33 extends StatefulWidget {
  const Regis33({super.key});

  @override
  State<Regis33> createState() => _Regis33State();
}

class _Regis33State extends State<Regis33> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  bool isVisiblity = false;
  bool isLoading = false;
  RegistrationModel user = RegistrationModel();

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
                'Registrasi',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.black, endIndent: 32, indent: 32),
              SizedBox(height: 12),
              buildInputUser(
                hintText: 'Nama',
                controller: nameC,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name tidak boleh kosong";
                  }
                  return null;
                },
              ),
              buildInputUser(
                hintText: 'Email',
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
                hintText: 'Kata Sandi',
                controller: passwordC,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Kata sandi tidak boleh kosong";
                  } else if (value.length < 6) {
                    return "Kata sandi minimal 6 karakter";
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              buildButton(
                text: 'DAFTAR',
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
                      final result = await AuthAPI.registerUser(
                        name: nameC.text,
                        email: emailC.text,
                        password: passwordC.text,
                      );
                      setState(() {
                        isLoading = false;
                        user = result;
                        PreferencesHandler.saveToken(user.data!.token!);
                      });
                      print(result);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => Login33()),
                      );
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
                          actions: [
                            TextButton(
                              child: Text("Kembali"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
              SizedBox(height: 48),
              Divider(color: Colors.black),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sudah punya akun?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Masuk'),
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
                    isVisiblity ? Icons.visibility : Icons.visibility_off,
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
