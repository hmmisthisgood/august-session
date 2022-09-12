import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbService {
  static late Database ourDb;
  static int _version = 1;

  static Future<void> initOurCoolDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = dir.path;

    final dbPath = path + "/app.db";

    print(path);

    ourDb = await openDatabase(
      dbPath,
      version: _version,
      onConfigure: (db) async {
        final String createNotesTable = '''
CREATE TABLE IF NOT EXISTS notes(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(100),
  body TEXT, 
  createdAt VARCHAR,
  updatedAt VARCHAR
);
''';

        print(createNotesTable);
        try {
          await db.execute(createNotesTable);
        } catch (e, s) {
          print(e);
          print(s);
        }
      },
      onCreate: (db, version) {},
      onUpgrade: (db, oldVersion, newVersion) {},
      onDowngrade: (db, oldVersion, newVesion) {},
      onOpen: (db) {},
    );
  }

  static createNote({String? title, String? body}) async {
    try {
      final res = await ourDb.insert(
        'notes',
        {
          "title": title,
          "body": body,
          "createdAt": DateTime.now().toString(),
        },
      );
      getNotes();
      print(res);
    } catch (e, s) {
      print(e);
    }
  }

  static Future<List> getNotes() async {
    try {
      final data = await ourDb.query(
        'notes',
        // limit: 10,
        // offset: 10 * 2,
        orderBy: "createdAt DESC",
      );
      return data;
    } catch (e, s) {
      print(e);
      return [];
    }
  }

  static updateNote({String? title, String? body, required int noteId}) async {
    print(noteId);
    try {
      await ourDb.update(
          "notes",
          {
            "title": title,
            "body": body,
            "updatedAt": DateTime.now().toString()
          },
          where: "id=?",
          whereArgs: [noteId]);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  static deleteNote(int noteId) async {
    print('deleting note: $noteId');
    try {
      await ourDb.delete("notes", where: 'id=?', whereArgs: [noteId]);
      // await ourDb.rawDelete('DELETE FROM notes WHERE id=?', [noteId]);
      getNotes();
    } catch (e, s) {
      print(e);
    }
  }
}
