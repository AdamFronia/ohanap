import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/menue_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/ohanabutton.dart';

class MenueausloggenScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const MenueausloggenScreen({super.key, required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
        databaseRepository: databaseRepository,
        content: Column(
          children: [
            Ohanabutton(
                databaseRepository: databaseRepository,
                text: "Account",
                destination:
                    MenueScreen(databaseRepository: databaseRepository)),
            Ohanabutton(
                databaseRepository: databaseRepository,
                text: "löschen",
                destination:
                    MenueScreen(databaseRepository: databaseRepository)),
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
                  Ohanabutton(
                      databaseRepository: databaseRepository,
                      text: "Nein",
                      destination:
                          MenueScreen(databaseRepository: databaseRepository)),
                  const SizedBox(height: 100),
                  Ohanabutton(
                      databaseRepository: databaseRepository,
                      text: "Ja",
                      destination:
                          MenueScreen(databaseRepository: databaseRepository)),
                ], //TODO ausloggen und account löschen ?!
              ),
            ),
            const SizedBox(height: 62),
          ],
        ));
  }
}
