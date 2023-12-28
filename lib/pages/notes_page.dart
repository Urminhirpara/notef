import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/models/note_database.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final textController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();


  }

  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<NoteDatabase>().addNote(textController.text);
              textController.clear();
              Navigator.pop(context);
            },
            child: Text("Create"),
          )
        ],
      ),
    );
  }

  void readNotes() {
    context.read()<NoteDatabase>().fetchNotes();
  }

  void updateNote(Note note){
    textController.text = note.text;
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text("Update Note"),
      content: TextField(controller: textController),
      actions: [
        MaterialButton(onPressed: (){
          context.read<NoteDatabase>().updateNote(note.id, textController.text);
          textController.clear();
          Navigator.pop(context);
        },
          child: const Text("Update"),
        )
      ],
    ),);
  }

  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }
  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();

    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: currentNotes.length,
        itemBuilder: (context, index) {
          final note = currentNotes[index];
          return ListTile(
            title: Text(note.text),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: ()=> updateNote(note), icon: Icon(Icons.edit)),
                IconButton(onPressed: ()=> deleteNote(note.id), icon: Icon(Icons.delete)),
              ],
            ),
          );
        },
      ),
    );
  }
}
