import 'package:flutter_p_2024/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _database;

  static Future<Database> get() async {
    if (_database == null) {
      var path = join(await getDatabasesPath(), 'banco');
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute(createTable);
          await db.execute(insertGrades);
        },
      );
    }
    //_database!.execute('delete from grades');
    //_database!.execute(insertGrades);
    return _database!;
  }
}
