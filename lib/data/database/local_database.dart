import 'package:medical_health_care/common/const/database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  Database? _database;

  Future<Database> get database async {
    print('get database():::::::::::');
    _database ??= await _initDB();
    print('get database()');
    return _database!;
  }

  Future<Database> _initDB() async {
    print('_initDB()');
    String path = join(await getDatabasesPath(), kDatabaseName);
    return await openDatabase(
      path,
      version: kDatabaseVersion,
      onCreate: _onCreate,
      onUpgrade: (db, oldVersion, newVersion) async {
        print('$oldVersion :: $newVersion');
        if (oldVersion < newVersion) {
          print('drop table $kTableDoctor');
          db.rawQuery('drop table $kTableDoctor');
          db.rawQuery('drop table $kTableSchedule');
          await _onCreate(db, newVersion);
        }
      },
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $kTableDoctor (
        uuid TEXT PRIMARY KEY,
        name TEXT DEFAULT '', 
        major TEXT DEFAULT '',
        rate REAL DEFAULT 0,
        image TEXT DEFAULT '',
        description TEXT DEFAULT '' 
        )''');

    await db.execute('''CREATE TABLE $kTableSchedule (
        uuid TEXT PRIMARY KEY,
        name TEXT DEFAULT '', 
        major TEXT DEFAULT '',
        image TEXT DEFAULT '',
        scheduleTime INTEGER DEFAULT 0,
        state TEXT DEFAULT ''
        )''');

    print('_onCreate table $kTableDoctor');
    await initData(db);
  }

  Future<void> initData(Database db) async {
    // Insert Init Data into Database
    print('Insert Init Data into Database');
    for (var doctorData in kDoctors) {
      print(doctorData.toJson());
      await db.insert(
        kTableDoctor,
        doctorData.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    for (var scheduleData in kSchedules) {
      print(scheduleData.toJson());
      await db.insert(
        kTableSchedule,
        scheduleData.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
