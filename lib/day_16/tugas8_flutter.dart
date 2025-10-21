import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_16/about.dart';
import 'package:flutter_demoppkd_ariq/day_16/tugas7_flutter.dart';

class Tugas8Flutter extends StatefulWidget {
  const Tugas8Flutter({super.key});

  @override
  State<Tugas8Flutter> createState() => _Tugas8FlutterState();
}

class _Tugas8FlutterState extends State<Tugas8Flutter> {
  int _selectedNavBar = 0;

  static const List<Widget> _navBarOptions = [Tugas7Flutter(), AboutWidget()];
  void _onBarTapped(int bar) {
    setState(() {
      _selectedNavBar = bar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _navBarOptions.elementAt(_selectedNavBar)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: "Tentang Aplikasi",
          ),
        ],
        currentIndex: _selectedNavBar,
        selectedItemColor: Colors.lightBlueAccent,
        onTap: _onBarTapped,
      ),
    );
  }
}
