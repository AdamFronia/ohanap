import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/menus/presentation/screens/admin_screen.dart';
import 'package:ohanap/src/features/menus/presentation/screens/contributing_screen.dart';
import 'package:ohanap/src/features/menus/presentation/screens/qrcode_screen.dart';
import 'package:ohanap/src/features/menus/presentation/screens/search_screen.dart';
import 'package:ohanap/src/features/menus/presentation/screens/wanted_posters_screen.dart';

import 'screens/blocked_user_screen.dart';
import 'screens/contact_information_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/imprint_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/signout_screen.dart';

class MenuScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
  // Konstruktor
  const MenuScreen(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      databaseRepository: databaseRepository,
      authRepository: authRepository,
      content: Column(
        children: [
          OhanaButton(
              databaseRepository: databaseRepository,
              text: "Suche",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ),
                );
              }),
          OhanaButton(
              databaseRepository: databaseRepository,
              text: "Steckbriefe",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WantedPostersScreen(
                        databaseRepository: databaseRepository,
                        authRepository: authRepository,
                      ),
                    ));
              }),
          OhanaButton(
              databaseRepository: databaseRepository,
              text: "Gallerie",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GalleryScreen(
                        databaseRepository: databaseRepository,
                        authRepository: authRepository,
                      ),
                    ));
              }),
          OhanaButton(
            databaseRepository: databaseRepository,
            text: "Einstellungen",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          OhanaButton(
            databaseRepository: databaseRepository,
            text: "Blockliste",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlockedUserScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          OhanaButton(
            databaseRepository: databaseRepository,
            text: "QR-Code",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QrcodeScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          OhanaButton(
            databaseRepository: databaseRepository,
            text: "Mitwirkende",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContributingScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          OhanaButton(
            databaseRepository: databaseRepository,
            text: "Admins",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          OhanaButton(
            databaseRepository: databaseRepository,
            text: "Kontaktinfos",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactInformationScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          OhanaButton(
            databaseRepository: databaseRepository,
            text: "Impressum",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImprintScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          OhanaButton(
            databaseRepository: databaseRepository,
            text: "Ausloggen",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignOutScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
