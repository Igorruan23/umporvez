import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:umporvez/Model/dbModel.dart';

class DB {
  static const String DATABASE_NAME = 'Um_por_vez.db';
  static late Database _database;

  // Construtor privado para impedir instâncias acidentais
  DB._();

  static Future<void> open() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE PROGRESS(id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'metaDescription TEXT, metaStartDate TEXT, goalDays INTEGER)');
      },
    );
  }

  static Future<int> insert(DBModel dbumporvez) async {
    return await _database.insert('PROGRESS', dbumporvez.toMap());
  }

  static Future<List<DBModel>> getallProgress() async {
    final List<Map<String, dynamic>> maps = await _database.query('PROGRESS');
    return List.generate(maps.length, (i) {
      return DBModel.fromMap(maps[i]);
    });
  }

  static Future<int> delete(int id) async {
    return await _database.delete('PROGRESS', where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> update(DBModel updateModel) async {
    return await _database.update('PROGRESS', updateModel.toMap(),
        where: 'id= ?', whereArgs: [updateModel.id]);
  }
}
