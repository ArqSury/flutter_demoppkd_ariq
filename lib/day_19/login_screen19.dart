import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_19/database/db_helper.dart';
import 'package:flutter_demoppkd_ariq/day_19/tugas11_flutter.dart';
import 'package:flutter_demoppkd_ariq/day_21/update21.dart';

class LoginScreen19 extends StatefulWidget {
  const LoginScreen19({super.key});
  static const id = '/login_scree19';
  @override
  State<LoginScreen19> createState() => _LoginScreen19State();
}

class _LoginScreen19State extends State<LoginScreen19> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController provController = TextEditingController();
  final TextInputType noHPInput = TextInputType.number;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 8,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "Selamat Datang!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
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
                          Text("ID:", style: TextStyle(fontSize: 20)),
                          buildUserInput(
                            isNoHP: true,
                            input: noHPInput,
                            hint: "Masukan NIK Anda",
                            controller: nikController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Wajib Diisi";
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
                          Text("Provinsi:", style: TextStyle(fontSize: 20)),
                          buildUserInput(
                            hint: "Masukan Provinsi Anda",
                            controller: provController,
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
                    SizedBox(height: 30),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final data = await DbHelper.loginPublic(
                            name: nameController.text,
                            province: provController.text,
                            nik: int.parse(nikController.text),
                            noHp: int.parse(noHPController.text),
                          );
                          if (data != null) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Apakah data anda sudah benar?"),
                                  content: Text(
                                    "Nama: ${nameController.text}\n"
                                    "ID: ${nikController.text}\n"
                                    "No.Hp: ${noHPController.text}\n"
                                    "Provinsi: ${provController.text}",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Update21(),
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
                                  title: Text("Akun Salah!"),
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
                        }
                      },
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Tidak punya akun?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tugas11Flutter(),
                              ),
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
