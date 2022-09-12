import 'package:first_app/util/db_service.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List notes = [];
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  createNote({String? title, String? body}) async {
    await DbService.createNote(title: title, body: body);
    getNotes();
  }

  getNotes() async {
    notes = await DbService.getNotes();
    setState(() {});
  }

  updateNote({String? title, String? body, required int noteId}) async {
    await DbService.updateNote(noteId: noteId, body: body, title: title);
    getNotes();
  }

  deleteNote(int noteId) async {
    await DbService.deleteNote(noteId);
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(hintText: "Enter note title"),
        ),
        TextField(
          controller: bodyController,
          decoration: InputDecoration(hintText: "Enter note body"),
        ),
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
                onPressed: () {
                  if (titleController.text.isEmpty &&
                      bodyController.text.isEmpty) {
                    return;
                  }
                  createNote(
                      title: titleController.text, body: bodyController.text);
                },
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

              final createdAt =
                  Jiffy(item['createdAt']).format("hh:mm, dd MMM yyyy");

              return InkWell(
                onDoubleTap: () {
                  updateNote(
                      title: "id ${item['id']}",
                      body: "boddddddy",
                      noteId: item['id']);
                  getNotes();
                },
                child: Padding(
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
                        Text(createdAt),
                      ],
                    ),
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