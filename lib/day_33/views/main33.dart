import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_33/model/profile_model.dart';
import 'package:flutter_demoppkd_ariq/day_33/service/api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Main33 extends StatefulWidget {
  const Main33({super.key});

  @override
  State<Main33> createState() => _Main33State();
}

class _Main33State extends State<Main33> {
  ProfileModel? profile;
  bool isLoading = false;
  bool isEditing = false;

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
        nameC.text = data.data?.name ?? "";
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
        isEditing = false;
        isLoading = false;
      });

      Fluttertoast.showToast(msg: "Profile Updated!");
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile List'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(isEditing ? Icons.close : Icons.edit),
              onPressed: () {
                setState(() {
                  isEditing = !isEditing;
                });
              },
            ),
          ],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : buildContent(),
      ),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            controller: nameC,
            enabled: isEditing,
            decoration: InputDecoration(labelText: "Nama"),
          ),
          SizedBox(height: 16),
          if (isEditing)
            ElevatedButton(
              onPressed: updateProfile,
              child: Text("Simpan Perubahan"),
            ),

          SizedBox(height: 32),
          Divider(),
          Text(
            "Dibuat: ${profile?.data?.createdAt}",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Text(
            "Update Terakhir: ${profile?.data?.updatedAt}",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
