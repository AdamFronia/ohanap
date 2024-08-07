import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ohanap/firebase_options.dart';
import 'package:ohanap/src/app.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/data/firestore_database.dart';
import 'package:ohanap/src/features/messages/screens/domain/chat_room_helper.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //DatabaseRepository databaseRepository = FirestoreDatabase();
  //AuthRepository authRepository = AuthRepository(FirebaseAuth.instance);
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthRepository>(
          create: (_) => AuthRepository(FirebaseAuth.instance),
        ),
        Provider<DatabaseRepository>(
          create: (_) => FirestoreDatabase(),
        ),
        ChangeNotifierProvider(create: (_) => ChatRoomHelper()),
      ],
      child: const App(),
    ),
  );
}






// zugriff auf user (UID,Email,DisplayName,PhotoURL)
//Login
//Regriestrierung
//AuthStateChanges