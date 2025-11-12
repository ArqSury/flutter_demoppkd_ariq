import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_32/model/harry_potter_char.dart';
import 'package:flutter_demoppkd_ariq/day_32/service/api.dart';
import 'package:flutter_demoppkd_ariq/day_32/views/profile_screen32.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HouseScreen32 extends StatefulWidget {
  final String house;
  const HouseScreen32({super.key, required this.house});

  @override
  State<HouseScreen32> createState() => _HouseScreen32State();
}

class _HouseScreen32State extends State<HouseScreen32> {
  List<HarryPotterChar> allCharacters = [];
  List<HarryPotterChar> filteredCharacters = [];
  bool isLoading = true;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    try {
      final data = await fetchCharacter();

      final houseChars = data
          .where(
            (char) =>
                char.house != null &&
                char.house.toString().split('.').last.toLowerCase() ==
                    widget.house.toLowerCase(),
          )
          .toList();

      houseChars.sort(
        (a, b) => (a.name ?? '').toLowerCase().compareTo(
          (b.name ?? '').toLowerCase(),
        ),
      );

      setState(() {
        allCharacters = houseChars;
        filteredCharacters = houseChars;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: 'Error loading character: $e');
    }
  }

  void _filterCharacters(String query) {
    setState(() {
      searchQuery = query;
      filteredCharacters = allCharacters
          .where(
            (c) =>
                c.name != null &&
                c.name!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final houseColor = _getHouseColor(widget.house);
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.house} House'),
        backgroundColor: houseColor,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : allCharacters.isEmpty
          ? Center(child: Text('No members in ${widget.house}.'))
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search character...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: _filterCharacters,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredCharacters.length,
                    itemBuilder: (context, index) {
                      final c = filteredCharacters[index];
                      return ListTile(
                        leading: _buildAvatar(c),
                        title: Text(c.name ?? 'Unknown'),
                        subtitle: Text(c.actor ?? ''),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProfileScreen32(character: c),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildAvatar(HarryPotterChar c) {
    final isMale = c.gender?.toString().split('.').last.toLowerCase() == 'male';
    final placeholder = isMale
        ? const AssetImage('assets/images/day_32/male_prov.jpg')
        : const AssetImage('assets/images/day_32/w_prov.jpg');

    return CircleAvatar(
      radius: 28,
      backgroundColor: isMale ? Colors.blue.shade100 : Colors.pink.shade100,
      backgroundImage: (c.image != null && c.image!.isNotEmpty)
          ? NetworkImage(c.image!)
          : placeholder,
    );
  }

  Color _getHouseColor(String house) {
    switch (house.toLowerCase()) {
      case 'gryffindor':
        return Colors.redAccent;
      case 'hufflepuff':
        return Colors.amber;
      case 'ravenclaw':
        return Colors.blueAccent;
      case 'slytherin':
        return Colors.green;
      default:
        return Colors.deepPurple;
    }
  }
}
