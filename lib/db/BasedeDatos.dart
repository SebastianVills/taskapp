import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase;

  static final DBAdmin db = DBAdmin._();
  DBAdmin._();

  Future<Database?> chekDatabase() async {
    if (myDatabase != null) {
      return myDatabase;
    }

    myDatabase = await initDatabase();
    return myDatabase;
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "baseDatos.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database dbx, int version) async {
        await dbx.execute(
            "CREATE TABLE task(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, status TEXT)");
      },
    );
  }

  insertRawTask() async {
    Database? db = await chekDatabase();
    int res = await db!.rawInsert(
        "INSERT INTO TASK(title, description, status) VALUE ('Ir de compras','Tenemos que ir a Tottus','false')");
    print(res);
  }

  insertTask() async {
    Database? db = await chekDatabase();
    int res = await db!.insert(
      "Task",
      {
        "title": "Comprar el nuevo disco",
        "description": "Nuevo disco de Epica",
        "status": "false",
      },
    );
    print(res);
  }

  getTasks() async {
    Database? db = await chekDatabase();
    List tasks = await db!.rawQuery("SELECT * FROM Task");
    print(tasks);
  }

  
}
