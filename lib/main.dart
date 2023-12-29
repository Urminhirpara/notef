



import 'package:flutter/material.dart';
import 'package:note/models/note.dart';
import 'package:note/pages/notes_page.dart';
import 'package:note/theme/theme_probider.dart';
import 'package:provider/provider.dart';

import 'models/note_database.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>NoteDatabase()),
      ChangeNotifierProvider(create: (context)=> ThemeProvider())
    ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
