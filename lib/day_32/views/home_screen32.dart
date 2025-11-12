import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_32/views/house_screen32.dart';

class HomeScreen32 extends StatefulWidget {
  const HomeScreen32({super.key});

  @override
  State<HomeScreen32> createState() => _HomeScreen32State();
}

class _HomeScreen32State extends State<HomeScreen32> {
  final List<String> houses = [
    'Gryffindor',
    'Hufflepuff',
    'Ravenclaw',
    'Slytherin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hogwarts Houses'),
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: houses.length,
        itemBuilder: (context, index) {
          final house = houses[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HouseScreen32(house: house)),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: _getHouseColor(house),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  house,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getHouseColor(String house) {
    switch (house) {
      case 'Gryffindor':
        return Colors.redAccent;
      case 'Hufflepuff':
        return Colors.amber;
      case 'Ravenclaw':
        return Colors.blueAccent;
      case 'Slytherin':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
