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

  static Future<void> registerPublic(PublicModel public) async {
    final dbs = await db();
    await dbs.insert(
      tablePublic,
      public.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<PublicModel>> getAllPublic() async {
    final db = await DbHelper.db();
    final List<Map<String, dynamic>> maps = await db.query('public');

    return List.generate(maps.length, (i) => PublicModel.fromMap(maps[i]));
  }
}
