import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ohanap/firebase_options.dart';
import 'package:ohanap/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}