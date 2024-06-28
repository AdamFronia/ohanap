import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ohanap/firebase_options.dart';
import 'package:ohanap/src/app.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/data/mock_database_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DatabaseRepository databaseRepository = MockDatabaseRepository();
  AuthRepository authRepository = AuthRepository(FirebaseAuth.instance);
  runApp(App(
    databaseRepository: databaseRepository,
    authRepository: authRepository,
  ));
}






// zugriff auf user (UID,Email,DisplayName,PhotoURL)
//Login
//Regriestrierung
//AuthStateChanges