import 'package:flutter/material.dart';
import 'package:flutter_demoppkd_ariq/day_32/model/harry_potter_char.dart';

class ProfileScreen32 extends StatefulWidget {
  final HarryPotterChar character;
  const ProfileScreen32({super.key, required this.character});

  @override
  State<ProfileScreen32> createState() => _ProfileScreen32State();
}

class _ProfileScreen32State extends State<ProfileScreen32> {
  late HarryPotterChar character;

  @override
  void initState() {
    super.initState();
    character = widget.character;
  }

  @override
  Widget build(BuildContext context) {
    final houseColor = _getHouseColor(
      character.house?.toString().split('.').last ?? '',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name ?? 'Character Details'),
        backgroundColor: houseColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage:
                  (character.image != null && character.image!.isNotEmpty)
                  ? NetworkImage(character.image!)
                  : (character.gender?.toString().split('.').last == 'MALE'
                            ? const AssetImage(
                                'assets/images/day_32/male_prov.jpg',
                              )
                            : const AssetImage(
                                'assets/images/day_32/w_prov.jpg',
                              ))
                        as ImageProvider,
            ),
            SizedBox(height: 20),
            Text(
              character.name ?? 'Unknown',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            if (character.actor != null && character.actor!.isNotEmpty)
              Text(
                'Played by: ${character.actor}',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            Divider(height: 30),
            _buildInfoRow(
              'House',
              character.house?.toString().split('.').last ?? '-',
            ),
            _buildInfoRow(
              'Gender',
              character.gender?.toString().split('.').last ?? '-',
            ),
            _buildInfoRow('Species', character.species ?? '-'),
            _buildInfoRow(
              'Ancestry',
              character.ancestry?.toString().split('.').last ?? '-',
            ),
            _buildInfoRow('Date of Birth', character.dateOfBirth ?? '-'),
            _buildInfoRow(
              'Year of Birth',
              character.yearOfBirth?.toString() ?? '-',
            ),
            _buildInfoRow(
              'Patronus',
              character.patronus?.toString().split('.').last ?? '-',
            ),
            _buildInfoRow(
              'Wand Core',
              character.wand?.core?.toString().split('.').last ?? '-',
            ),
            _buildInfoRow(
              'Wand Length',
              character.wand?.length?.toString() ?? '-',
            ),
            SizedBox(height: 20),
            if (character.alive != null)
              Text(
                character.alive! ? '🟢 Alive' : '🔴 Deceased',
                style: TextStyle(
                  fontSize: 16,
                  color: character.alive! ? Colors.green : Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
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
