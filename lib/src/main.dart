import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memomate_app/src/app.dart';
import 'package:memomate_app/src/models/notes_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the Hive database
  await Hive.initFlutter();

  // Register an adapter
  Hive.registerAdapter(NotesAdapter());

  //  Initialize and open Hive boxes
  await Hive.openBox<Notes>('noteBox');
  var taskBox = await Hive.openBox('taskBox');

  // Disable landscape mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}
