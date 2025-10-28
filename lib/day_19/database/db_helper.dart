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
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          await db.execute(
            "CREATE TABLE $tablePublic(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, province TEXT, nik int, noHp int)",
          );
        }
      },

      version: 2,
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

  static Future<PublicModel?> loginPublic({
    required String name,
    required String province,
    required int nik,
    required int noHp,
  }) async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(
      tablePublic,
      where: 'name = ? AND province = ? AND nik = ? AND noHp = ?',
      whereArgs: [name, province, nik, noHp],
    );
    if (results.isNotEmpty) {
      return PublicModel.fromMap(results.first);
    }
    return null;
  }

  static Future<List<PublicModel>> getAllPublic() async {
    final db = await DbHelper.db();
    final List<Map<String, dynamic>> maps = await db.query('public');
    return List.generate(maps.length, (i) => PublicModel.fromMap(maps[i]));
  }

  static Future<void> updatePublic(PublicModel public) async {
    final dbs = await db();
    await dbs.update(
      tablePublic,
      public.toMap(),
      where: 'id = ?',
      whereArgs: [public.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deletePublic(int id) async {
    final dbs = await db();
    return dbs.delete(tablePublic, where: 'id = ?', whereArgs: [id]);
  }
}
