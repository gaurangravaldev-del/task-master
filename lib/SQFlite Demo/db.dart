import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDB {
  late Database db;

  Future Open() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'tops.db');
    print(path);

    db = await openDatabase(
        path, version: 1, onCreate: (Database db, int versin) async {
      db.execute('''
            
             CREATE TABLE IF NOT EXISTS students( 
                          id primary key,
                          name varchar(255) not null,
                          surname varchar(255) not null,
                          email varchar(255) not null,
                          pass varchar(255) not null
                      );

                     ''');
    });
    print('Table Created');
  }
}