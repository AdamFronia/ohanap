import 'package:flutter/material.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/home_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/login_screen.dart';

class AuthenticationManagerScreen extends StatelessWidget {
  final AuthRepository authRepository;
  final DatabaseRepository databaseRepository;

  const AuthenticationManagerScreen(
      {super.key,
      required this.authRepository,
      required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authRepository.authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          print("---- USER LOGGED IN : ${user != null} ----");
          return user == null
              ? LoginScreen(
                  databaseRepository: databaseRepository,
                  authRepository: authRepository,
                )
              : HomeScreen(
                  databaseRepository: databaseRepository,
                  authRepository: authRepository,
                );
        });
  }
}
