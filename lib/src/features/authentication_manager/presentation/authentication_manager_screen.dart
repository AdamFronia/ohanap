import 'package:flutter/material.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/features/home/presentation/home_screen.dart';
import 'package:provider/provider.dart';

import '../../authentication/presentation/login/login_screen.dart';

class AuthenticationManagerScreen extends StatelessWidget {
  const AuthenticationManagerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.read<AuthRepository>().authStateChanges(),
        builder: (context, snapshot) {
          final user = snapshot.data;
          print("---- USER LOGGED IN : ${user != null} ----");
          return user == null ? const LoginScreen() : const HomeScreen();
        });
  }
}
