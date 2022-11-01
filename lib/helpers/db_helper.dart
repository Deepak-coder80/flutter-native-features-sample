import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  //static because it want to initiate without creating object of class
  //future-database access - async body

  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(
      //create database if not there
      path.join(dbPath, 'places.db'),
      //c
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_place(id TEXT PRIMARY KEY, title TEXT,image TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    //create database if not present
    //inset things
    final db=await DBHelper.database();
   db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
      //conflict algorthim repalce if already exists
    );
  }

  static Future<List<Map<String,dynamic>>> getData(String table) async{
    final db=await DBHelper.database();
    return db.query(table);
  }
}
