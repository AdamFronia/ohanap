import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/features/menus/presentation/menu_screen.dart';
import 'package:ohanap/src/features/welcome/presentation/splash_screen.dart';

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
            //logout
            FirebaseAuth.instance.signOut();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SplashScreen()));
          },
        ),
        const SizedBox(height: 92),
        const Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 400),
            ],
          ),
        ),
      ],
    ));
  }
}
