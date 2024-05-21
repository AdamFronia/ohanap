import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
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

  // Konstruktor
  const MenueScreen({super.key, required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      databaseRepository: databaseRepository,
      content: Column(
        children: [
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Suche",
            destination:
                MenuesucheScreen(databaseRepository: databaseRepository),
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Steckbriefe",
            destination:
                MenuesteckbriefeScreen(databaseRepository: databaseRepository),
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Gallerie",
            destination:
                MenuegallerieScreen(databaseRepository: databaseRepository),
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Einstellungen",
            destination: MenueeinstellungenScreen(
                databaseRepository: databaseRepository),
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Blockliste",
            destination:
                MenueblocklisteScreen(databaseRepository: databaseRepository),
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "QR-Code",
            destination:
                MenueqrcodeScreen(databaseRepository: databaseRepository),
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Mitwirkende",
            destination:
                MenuemitwirkendeScreen(databaseRepository: databaseRepository),
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Admins",
            destination:
                MenueadminsScreen(databaseRepository: databaseRepository),
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Kontaktinfos",
            destination:
                MenuekontaktinfosScreen(databaseRepository: databaseRepository),
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Impressum",
            destination:
                MenueimpressumScreen(databaseRepository: databaseRepository),
          ),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Ausloggen",
            destination:
                MenueausloggenScreen(databaseRepository: databaseRepository),
          ),
        ],
      ),
    );
  }
}
