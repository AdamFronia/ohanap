import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/menuesteckbriefe_screen.dart';

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
          buildMenuButton(context, 'Suche'),
          buildMenuButton(context, 'Steckbriefe'),
          buildMenuButton(context, 'Gallerie'),
          buildMenuButton(context, 'Einstellungen'),
          buildMenuButton(context, 'Blockliste'),
          buildMenuButton(context, 'QR-Code'),
          buildMenuButton(context, 'Mitwirkende'),
          buildMenuButton(context, 'Admins'),
          buildMenuButton(context, 'Kontaktinfos'),
          buildMenuButton(context, 'Impressum'),
          buildMenuButton(context, 'Ausloggen'),
        ],
      ),
    );
  }
}
