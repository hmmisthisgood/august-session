import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  int _version = 1;
  late Database ourDb;
  List notes = [];
  @override
  void initState() {
    super.initState();
    initOurCoolDatabase();
  }

  initOurCoolDatabase() async {
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

  createNote() async {
    try {
      final res = await ourDb.insert(
        'notes',
        {
          "title": "buy milk",
          "body": "buy 2 literes of cow milk and 1 litere of buffalo milk",
          "createdAt": DateTime.now().toString(),
        },
      );
      getNotes();
      print(res);
    } catch (e, s) {
      print(e);
    }
  }

  getNotes() async {
    try {
      final data = await ourDb.query('notes');
      notes = data;
      setState(() {});
    } catch (e, s) {
      print(e);
    }
  }

  updateNote() {}
  deleteNote(int noteId) async {
    print('deleting note: $noteId');
    try {
      await ourDb.delete("notes", where: 'id=?', whereArgs: [noteId]);
      // await ourDb.rawDelete('DELETE FROM notes WHERE id=?', [noteId]);
      getNotes();
    } catch (e, s) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          children: [
            Expanded(
              child: MaterialButton(
                onPressed: getNotes,
                color: Colors.green,
                child: Text("Get notes", style: TextStyle(color: Colors.white)),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: createNote,
                color: Colors.red,
                child: Text("Add note", style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final item = notes[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${index + 1}. ${item['title']}",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              deleteNote(item['id']);
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      Text(item['body']),
                      Text(item['createdAt']),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}

/// CRUD
/// c= create/insert
/// r= read
/// u= update
/// d= delete