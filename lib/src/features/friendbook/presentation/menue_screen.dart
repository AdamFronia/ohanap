import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/menueadmins_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menueausloggen_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menueblockliste_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menueeinstellungen_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menuegallerie_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menueimpressum_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menuekontaktinfos_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menuemitwirkende_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menueqrcode_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menuesteckbriefe_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menuesuche_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/ohanabutton.dart';

class MenueScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
  // Konstruktor
  const MenueScreen(
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
          Ohanabutton(
              databaseRepository: databaseRepository,
              text: "Suche",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuesucheScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ),
                );
              }),
          Ohanabutton(
              databaseRepository: databaseRepository,
              text: "Steckbriefe",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuesteckbriefeScreen(
                        databaseRepository: databaseRepository,
                        authRepository: authRepository,
                      ),
                    ));
              }),
          Ohanabutton(
              databaseRepository: databaseRepository,
              text: "Gallerie",
              onTap: () {
                Ohanabutton(
                    databaseRepository: databaseRepository,
                    text: "Steckbriefe",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuegallerieScreen(
                              databaseRepository: databaseRepository,
                              authRepository: authRepository,
                            ),
                          ));
                    });
              }),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Einstellungen",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenueeinstellungenScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Blockliste",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenueblocklisteScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "QR-Code",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenueqrcodeScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Mitwirkende",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuemitwirkendeScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Admins",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenueadminsScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Kontaktinfos",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuekontaktinfosScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Impressum",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenueimpressumScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Ausloggen",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenueausloggenScreen(
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
