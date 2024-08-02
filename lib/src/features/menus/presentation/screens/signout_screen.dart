import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/features/menus/presentation/menu_screen.dart';
import 'package:ohanap/src/features/welcome/presentation/splash_screen.dart';
import 'package:provider/provider.dart';

class SignOutScreen extends StatelessWidget {
  // Attribute

  // Konstruktor
  const SignOutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
        content: Column(
      children: [
        OhanaButton(
          text: "Account",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MenuScreen()));
          },
        ),
        OhanaButton(
          text: "logout",
          onTap: () {
            FirebaseAuth.instance.signOut();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SplashScreen()));
          },
        ),
        OhanaButton(
          text: "löschen",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MenuScreen()));
          },
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Divider(
            color: Color.fromARGB(255, 0, 0, 0),
            thickness: 1,
          ),
        ),
        const SizedBox(height: 92),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OhanaButton(
                text: "Nein",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuScreen()));
                },
              ),
              const SizedBox(height: 100),
              OhanaButton(
                text: "Ja",
                onTap: () {
                  context.read<AuthRepository>().logout();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuScreen()));
                },
              ),
            ], //TODO ausloggen und account löschen ?!
          ),
        ),
        const SizedBox(height: 62),
      ],
    ));
  }
}
