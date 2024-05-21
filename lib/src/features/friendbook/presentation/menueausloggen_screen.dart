import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/menuesteckbriefe_screen.dart';

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
            buildMenuButton(context, 'Ausloggen'),
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
                  buildMenuButton(context, 'Sicher?'),
                  const SizedBox(height: 100),
                  buildMenuButton(context, 'Ja'),
                ],
              ),
            ),
          ],
        ));
  }
}
