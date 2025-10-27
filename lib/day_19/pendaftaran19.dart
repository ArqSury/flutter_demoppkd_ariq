import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_19/database/db_helper.dart';
import 'package:flutter_demoppkd_ariq/day_19/login_screen19.dart';
import 'package:flutter_demoppkd_ariq/day_19/model/public_model.dart';

class Pendaftaran19 extends StatefulWidget {
  const Pendaftaran19({super.key, required this.name, required this.kota});
  final String name;
  final String kota;
  @override
  State<Pendaftaran19> createState() => _Pendaftaran19State();
}

class _Pendaftaran19State extends State<Pendaftaran19> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: DbHelper.getAllPublic(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
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
    );
  }
}
