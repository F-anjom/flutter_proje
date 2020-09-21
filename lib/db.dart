import 'dart:convert';
import 'dart:io';
import 'package:flutter_proje/resourses.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DB {

  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  // make this a singleton class
  DB._privateConstructor();
  static final DB instance = DB._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await Gonah.onCreate(db);

  }
}

class Gonah {
  static const String TABLE = "gonah";

  static const String COLUMN_ID = "id";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_TEXT = "text";
  static const String COLUMN_ALAJ = "alaj";
  static const String COLUMN_RESOURCES = "resources";

  final int id;
  final String title;
  final String text;
  final String alaj;
  final String resources;


  Gonah(this.id, this.title, this.text, this.alaj, this.resources);

  static Future onCreate(Database db) async {
    await db.execute('''
          CREATE TABLE $TABLE (
            $COLUMN_ID INTEGER PRIMARY KEY,
            $COLUMN_TITLE TEXT NOT NULL,
            $COLUMN_TEXT TEXT NOT NULL,
            $COLUMN_ALAJ TEXT NOT NULL,
            $COLUMN_RESOURCES TEXT
          )
          ''');
    fillIt(db);
  }


  Gonah.fromJson(Map<String, dynamic> json)
      : id = json[COLUMN_ID],
        title = json[COLUMN_TITLE],
        text = json[COLUMN_TEXT],
        alaj = json[COLUMN_ALAJ],
        resources = json[COLUMN_RESOURCES];

  Map<String, dynamic> toJson() =>
      {
        COLUMN_ID : id,
        COLUMN_TITLE : title,
        COLUMN_TEXT : text,
        COLUMN_ALAJ: alaj,
        COLUMN_RESOURCES: resources,
      };

  static void fillIt(Database db) {
    var gonah1 = Gonah(
      1,
      "تهمت",
      Res.gonahExample,
      Res.gonahExample,
        jsonEncode([
          {
            "title": "داستان راستان",
            "author": "شهید دستغیب",
            "publisher": "شیرازیون",
            "img_url": "1.jpg"
          },
          {
            "title": "داستان دوم",
            "author": "حسن شیبانی",
            "publisher": "کرمان نشر",
            "img_url": "2.jpg"
          }
        ])
    );

    db.insert(TABLE, gonah1.toJson());
  }


  static Future clearTable() async {
    await (await DB.instance.database).execute("DELETE FROM $TABLE");
  }


  static Future<List<Map<String, dynamic>>> all({int limit = 30}) async {
    return (await DB.instance.database).query(TABLE, limit: limit);
  }

  static Future<List<Map<String, dynamic>>> ids() async{
    return (await DB.instance.database).rawQuery("SELECT $COLUMN_ID from $TABLE;");
  }
  static Future<List<Map<String, dynamic>>> titles() async{
    return (await DB.instance.database).rawQuery("SELECT $COLUMN_TITLE from $TABLE;");
  }
  static Future<List<Map<String, dynamic>>> titlesAndIds() async{
    return (await DB.instance.database).rawQuery("SELECT $COLUMN_ID, $COLUMN_TITLE from $TABLE;");
  }
  static Future<List<Map<String, dynamic>>> byId(int id) async{
    return (await DB.instance.database).query(TABLE, where: 'id = ?', whereArgs: [id]);
  }

}