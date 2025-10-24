// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PublicModel {
  String name;
  String province;
  int id;
  int noHp;
  PublicModel({
    required this.name,
    required this.province,
    required this.id,
    required this.noHp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'province': province,
      'nik': id,
      'noHp': noHp,
    };
  }

  factory PublicModel.fromMap(Map<String, dynamic> map) {
    return PublicModel(
      name: map['name'] as String,
      province: map['province'] as String,
      id: map['nik'] as int,
      noHp: map['noHp'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicModel.fromJson(String source) =>
      PublicModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
