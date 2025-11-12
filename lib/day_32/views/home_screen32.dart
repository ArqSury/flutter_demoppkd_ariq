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
      backgroundColor: Color(0xFFFFE08F),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/day_32/gandalf.gif'),
                radius: 60,
              ),
              SizedBox(height: 16),
              Text(
                'Pick your House!',
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              buildHouse(),
            ],
          ),
        ),
      ),
    );
  }

  GridView buildHouse() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.3,
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
              boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black)],
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
