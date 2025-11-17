import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_33/branches/home33.dart';
import 'package:flutter_demoppkd_ariq/day_33/views/login33.dart';

class Main33 extends StatefulWidget {
  const Main33({super.key});

  @override
  State<Main33> createState() => _Main33State();
}

class _Main33State extends State<Main33> {
  int _selectedDrawer = 0;

  static const List<Widget> _drawerOption = [Home33()];

  void onTapped(int index) {
    setState(() {
      _selectedDrawer = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/app1/profil_foto.jpg',
                  ),
                ),
                title: Text('Sekip App'),
                subtitle: Text('Ariq Surya Wardhana'),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  onTapped(0);
                },
                leading: Icon(Icons.home),
                title: Text('Beranda'),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login33()),
                    (route) => false,
                  );
                },
                leading: Icon(Icons.logout),
                title: Text('Keluar'),
              ),
            ],
          ),
        ),
        body: _drawerOption[_selectedDrawer],
      ),
    );
  }
}
