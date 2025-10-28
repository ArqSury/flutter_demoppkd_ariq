// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PublicModel {
  int? id;
  String name;
  String province;
  int nik;
  int noHp;
  PublicModel({
    this.id,
    required this.name,
    required this.province,
    required this.nik,
    required this.noHp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'province': province,
      'nik': nik,
      'noHp': noHp,
    };
  }

  factory PublicModel.fromMap(Map<String, dynamic> map) {
    return PublicModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      province: map['province'] as String,
      nik: map['nik'] as int,
      noHp: map['noHp'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicModel.fromJson(String source) =>
      PublicModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
