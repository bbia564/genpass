
import 'package:create_password/db_password/password_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';


class DBPassword extends GetxService {
  late Database dbBase;

  Future<DBPassword> init() async {
    await createPasswordDB();
    return this;
  }

  createPasswordDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'password.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createPasswordTable(db);
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('upValue', true);
          await prefs.setBool('downValue', true);
          await prefs.setBool('numValue', true);
          await prefs.setBool('symbolValue', true);
        });
  }

  createPasswordTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS password (id INTEGER PRIMARY KEY, createTime TEXT, password TEXT)');
  }

  insertPassword(PasswordEntity entity) async {
    final id = await dbBase.insert('password', {
      'createTime': entity.createTime.toIso8601String(),
      'password': entity.password,
    });
    return id;
  }

  cleanPasswordData() async {
    await dbBase.delete('password');
  }

  Future<List<PasswordEntity>> getPasswordAllData() async {
    var result = await dbBase.query('password', orderBy: 'createTime DESC');
    return result.map((e) => PasswordEntity.fromJson(e)).toList();
  }
}
