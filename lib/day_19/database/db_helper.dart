import 'package:flutter_demoppkd_ariq/day_19/model/public_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const tablePublic = 'public';
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'public.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $tablePublic(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, province TEXT, nik int, noHp int)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertPublicModel(PublicModel public) async {}
}
