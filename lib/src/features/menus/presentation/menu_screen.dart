import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/features/menus/presentation/screens/admin_screen.dart';
import 'package:ohanap/src/features/menus/presentation/screens/contributing_screen.dart';
import 'package:ohanap/src/features/menus/presentation/screens/wanted_posters_screen.dart';

import 'screens/blocked_user_screen.dart';
import 'screens/contact_information_screen.dart';
import 'screens/imprint_screen.dart';
import 'screens/signout_screen.dart';

class MenuScreen extends StatelessWidget {
  // Attribute

  // Konstruktor
  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      content: Column(
        children: [
          OhanaButton(
              text: "Steckbriefe",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WantedPostersScreen(),
                    ));
              }),
          OhanaButton(
            text: "Blockliste",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BlockedUserScreen(),
                  ));
            },
          ),
          OhanaButton(
            text: "Mitwirkende",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContributingScreen(),
                  ));
            },
          ),
          OhanaButton(
            text: "Admins",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminScreen(),
                  ));
            },
          ),
          OhanaButton(
            text: "Kontaktinfos",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactInformationScreen(),
                  ));
            },
          ),
          OhanaButton(
            text: "Impressum",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImprintScreen(),
                  ));
            },
          ),
          OhanaButton(
            text: "Ausloggen",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignOutScreen(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
