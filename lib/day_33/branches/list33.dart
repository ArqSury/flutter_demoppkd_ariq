import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_33/model/profile_model.dart';
import 'package:flutter_demoppkd_ariq/day_33/service/api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class List33 extends StatefulWidget {
  const List33({super.key});

  @override
  State<List33> createState() => _List33State();
}

class _List33State extends State<List33> {
  ProfileModel? profile;
  bool isLoading = false;

  final TextEditingController nameC = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    setState(() => isLoading = true);

    try {
      final data = await AuthAPI.getProfile();
      setState(() {
        profile = data;
        isLoading = false;
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      setState(() => isLoading = false);
    }
  }

  Future<void> updateProfile() async {
    setState(() => isLoading = true);

    try {
      final newProfile = await AuthAPI.updateProfile(name: nameC.text);

      setState(() {
        profile = newProfile;
        isLoading = false;
      });

      Fluttertoast.showToast(msg: "Profile Updated!");
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      setState(() => isLoading = false);
    }
  }

  void showEditNameDialog() {
    nameC.text = profile?.data?.name ?? "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Nama"),
          content: TextField(
            controller: nameC,
            decoration: InputDecoration(
              labelText: "Nama Baru",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              child: Text("Batal"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: Text("Simpan"),
              onPressed: () async {
                Navigator.pop(context);
                await updateProfile();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : buildContent(),
      ),
    );
  }

  Widget buildContent() {
    return ListView(
      children: [
        Card(
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: Colors.black),
          ),
          elevation: 8,
          child: ListTile(
            leading: IconButton(
              onPressed: () {
                showEditNameDialog();
              },
              icon: Icon(Icons.edit),
            ),
            title: Text(
              'Nama: ${profile?.data?.name}\n'
              'Email: ${profile?.data?.email}',
            ),
            subtitle: Text(
              'Dibuat: ${profile?.data?.updatedAt}\n'
              'Diperbarui: ${profile?.data?.updatedAt}',
            ),
          ),
        ),
      ],
    );
  }
}
