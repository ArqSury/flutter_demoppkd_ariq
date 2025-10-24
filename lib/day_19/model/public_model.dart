import 'dart:convert';

class PublicModel {
  int? nik;
  int? noHp;
  String name;
  String province;
  PublicModel({
    required this.name,
    required this.nik,
    required this.province,
    required this.noHp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'nik': nik,
      'province': province,
      'noHp': noHp,
    };
  }

  factory PublicModel.fromMap(Map<String, dynamic> map) {
    return PublicModel(
      name: map['name'] as String,
      nik: map['nik'] as int,
      province: map['province'] as String,
      noHp: map['noHp'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicModel.fromJson(String source) =>
      PublicModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
