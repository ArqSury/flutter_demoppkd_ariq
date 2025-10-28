import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_19/database/db_helper.dart';
import 'package:flutter_demoppkd_ariq/day_19/login_screen19.dart';
import 'package:flutter_demoppkd_ariq/day_19/model/public_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Update21 extends StatefulWidget {
  const Update21({super.key});
  @override
  State<Update21> createState() => _Update21State();
}

class _Update21State extends State<Update21> {
  final nameC = TextEditingController();
  final idC = TextEditingController();
  final provC = TextEditingController();
  final numbC = TextEditingController();
  getData() {
    DbHelper.getAllPublic();
    setState(() {});
  }

  Future<void> _onEdit(PublicModel public) async {
    final editNameC = TextEditingController(text: public.name);
    final editIdC = TextEditingController(text: public.nik.toString());
    final editProvC = TextEditingController(text: public.province);
    final editNumbC = TextEditingController(text: public.noHp.toString());
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Profil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              buildTextForm(hint: 'Nama', controller: editNameC),
              buildTextForm(hint: 'Provinsi', controller: editProvC),
              buildTextForm(hint: 'ID', controller: editIdC),
              buildTextForm(hint: 'No. Hp', controller: editNumbC),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Batal', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );

    if (res == true) {
      final updated = PublicModel(
        id: public.id,
        name: editNameC.text,
        province: editProvC.text,
        nik: int.parse(editIdC.text),
        noHp: int.parse(editNumbC.text),
      );
      DbHelper.updatePublic(updated);
      getData();
      Fluttertoast.showToast(msg: 'Data berhasil di update');
    }
  }

  Future<void> _onDelete(PublicModel public) async {
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hapus Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text(
                "Apakah anda yakin ingin menghapus data ${public.name}?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Tidak"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Iya"),
            ),
          ],
        );
      },
    );
    if (res == true) {
      DbHelper.deletePublic(public.id!);
      getData();
      Fluttertoast.showToast(msg: "Data berhasil di hapus");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pendaftaran",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.all(8),
                width: double.infinity,
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama:", style: TextStyle(fontSize: 16)),
                    buildTextForm(hint: 'Masukan nama Anda', controller: nameC),
                    Text("ID:", style: TextStyle(fontSize: 16)),
                    buildTextForm(
                      hint: 'Masukan NIK Anda',
                      controller: idC,
                      isNumber: true,
                    ),
                    Text("No. HP:", style: TextStyle(fontSize: 16)),
                    buildTextForm(
                      hint: 'Masukan no. Hp Anda',
                      controller: numbC,
                      isNumber: true,
                    ),
                    Text("Provinsi:", style: TextStyle(fontSize: 16)),
                    buildTextForm(
                      hint: 'Masukan domisili Anda',
                      controller: provC,
                    ),
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
                  } else if (idC.text.isEmpty) {
                    Fluttertoast.showToast(msg: "ID belum diisi");
                  } else if (numbC.text.isEmpty) {
                    Fluttertoast.showToast(msg: "No. Hp belum diisi");
                  } else if (provC.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Provinsi belum diisi");
                  } else {
                    final PublicModel dataPublic = PublicModel(
                      name: nameC.text,
                      province: provC.text,
                      nik: int.parse(idC.text),
                      noHp: int.parse(numbC.text),
                    );
                    DbHelper.registerPublic(dataPublic).then((value) {
                      nameC.clear();
                      provC.clear();
                      numbC.clear();
                      idC.clear();
                      getData();
                      Fluttertoast.showToast(msg: 'Anda Berhasil Mendaftar');
                    });
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
              Divider(color: Colors.black),
              FutureBuilder(
                future: DbHelper.getAllPublic(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.data == null) {
                    return Text('Data Kosong');
                  } else {
                    final data = snapshot.data as List<PublicModel>;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final items = data[index];
                          return Column(
                            children: [
                              ListTile(
                                title: Text(items.name),
                                subtitle: Text(items.province),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        _onEdit(items);
                                      },
                                      icon: Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _onDelete(items);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen19()),
                    (route) => true,
                  );
                },
                child: Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextForm({
    String? hint,
    bool isNumber = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      keyboardType: isNumber ? TextInputType.number : null,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
