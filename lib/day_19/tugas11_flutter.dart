import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_19/database/db_helper.dart';
import 'package:flutter_demoppkd_ariq/day_19/model/public_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Tugas11Flutter extends StatefulWidget {
  const Tugas11Flutter({super.key});

  @override
  State<Tugas11Flutter> createState() => _Tugas11FlutterState();
}

class _Tugas11FlutterState extends State<Tugas11Flutter> {
  final nameC = TextEditingController();
  final nikC = TextEditingController();
  final noHpC = TextEditingController();
  final provC = TextEditingController();
  getData() {
    DbHelper.getAllPublic();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                "Registrasi",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.all(8),
                width: double.infinity,
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama:", style: TextStyle(fontSize: 16)),
                    buildUserInput(hint: 'Nama', controller: nameC),
                    Text("ID:", style: TextStyle(fontSize: 16)),
                    buildUserInput(
                      hint: 'Nomor Induk Kependudukan(NIK)',
                      controller: nikC,
                      isNumber: true,
                    ),
                    Text("No. HP:", style: TextStyle(fontSize: 16)),
                    buildUserInput(
                      hint: 'Nomor Handphone / Whatsapp',
                      controller: noHpC,
                      isNumber: true,
                    ),
                    Text("Provinsi:", style: TextStyle(fontSize: 16)),
                    buildUserInput(hint: 'Sesuai KTP', controller: provC),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(80, 40),
                  backgroundColor: Colors.lightBlueAccent,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
                  ),
                ),
                onPressed: () {
                  if (nameC.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Nama belum diisi");
                  } else if (nikC.text.isEmpty) {
                    Fluttertoast.showToast(msg: "ID belum diisi");
                  } else if (noHpC.text.isEmpty) {
                    Fluttertoast.showToast(msg: "No. Hp belum diisi");
                  } else if (provC.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Provinsi belum diisi");
                  } else {
                    final PublicModel dataPublic = PublicModel(
                      name: nameC.text,
                      province: provC.text,
                      nik: int.parse(nikC.text),
                      noHp: int.parse(noHpC.text),
                    );
                    DbHelper.registerPublic(dataPublic);
                    Fluttertoast.showToast(msg: 'Anda Berhasil Mendaftar');
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Daftar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildUserInput({
    String? hint,
    TextEditingController? controller,
    String? Function(String?)? validator,
    bool isNumber = false,
  }) {
    return TextFormField(
      keyboardType: isNumber ? TextInputType.number : null,
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
