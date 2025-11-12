import 'dart:convert';
import 'package:flutter_demoppkd_ariq/day_32/model/harry_potter_char.dart';
import 'package:http/http.dart' as http;

Future<List<HarryPotterChar>> fetchCharacter() async {
  final response = await http.get(
    Uri.parse('https://hp-api.onrender.com/api/characters'),
  );
  if (response.statusCode == 200) {
    final List<dynamic> characterJson = json.decode(response.body);
    return characterJson.map((json) => HarryPotterChar.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load character');
  }
}
