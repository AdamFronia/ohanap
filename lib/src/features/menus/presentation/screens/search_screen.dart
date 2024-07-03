import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/menus/presentation/menu_screen.dart';

class SearchScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
  // Konstruktor
  const SearchScreen(
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
                        builder: (context) => MenuScreen(
                              databaseRepository: databaseRepository,
                              authRepository: authRepository,
                            )));
              },
            ),

            // Eingabefeld für Suche
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Suche',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ));
  }
}
