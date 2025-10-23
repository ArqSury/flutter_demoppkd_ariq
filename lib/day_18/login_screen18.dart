import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_18/pendaftaran18.dart';
import 'package:flutter_demoppkd_ariq/shared_preferences/preferences_handler.dart';

class LoginScreen18 extends StatefulWidget {
  const LoginScreen18({super.key});

  @override
  State<LoginScreen18> createState() => _LoginScreen18State();
}

class _LoginScreen18State extends State<LoginScreen18> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController kotaController = TextEditingController();
  final TextInputType noHPInput = TextInputType.number;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                spacing: 8,
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Selamat Datang!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.all(8),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Text("Nama:", style: TextStyle(fontSize: 20)),
                        buildUserInput(
                          hint: "Masukan Nama Anda",
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "*Wajib Diisi";
                            }
                            return null;
                          },
                        ),
                        Text("Email:", style: TextStyle(fontSize: 20)),
                        buildUserInput(
                          hint: "Masukan Email Anda",
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Wajib Diisi";
                            } else if (!value.contains("@")) {
                              return "Email tidak benar";
                            } else if (!RegExp(
                              r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                            ).hasMatch(value)) {
                              return "Email Tidak Benar";
                            }
                            return null;
                          },
                        ),
                        Text("No. HP:", style: TextStyle(fontSize: 20)),
                        buildUserInput(
                          isNoHP: true,
                          input: noHPInput,
                          hint: "Masukan No. Hp Anda",
                          controller: noHPController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            return null;
                          },
                        ),
                        Text("Kota Domisili:", style: TextStyle(fontSize: 20)),
                        buildUserInput(
                          hint: "Masukan Kota Domisili Anda",
                          controller: kotaController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "*Wajib Diisi";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                      backgroundColor: Colors.lightBlueAccent,
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadiusGeometry.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Apakah data anda sudah benar?"),
                              content: Text(
                                "Nama: ${nameController.text}\n"
                                "Email: ${emailController.text}\n"
                                "No.Hp: ${noHPController.text}\n"
                                "Kota Domisili: ${kotaController.text}",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    PreferencesHandler.saveLogin(true);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Pendaftaran18(
                                          name: nameController.text,
                                          kota: kotaController.text,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("Lanjut"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Kembali"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Validasi Salah!"),
                              content: Text("Isi semua data Anda"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Kembali"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildUserInput({
    String? hint,
    TextEditingController? controller,
    String? Function(String?)? validator,
    TextInputType? input,
    bool isNoHP = false,
  }) {
    return TextFormField(
      keyboardType: isNoHP ? input : null,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
    );
  }
}
