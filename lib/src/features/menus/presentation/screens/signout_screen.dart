import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/menus/presentation/menu_screen.dart';

class SignOutScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
  // Konstruktor
  const SignOutScreen(
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
              text: "Account",
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
            OhanaButton(
              databaseRepository: databaseRepository,
              text: "löschen",
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
                    databaseRepository: databaseRepository,
                    text: "Nein",
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
                  const SizedBox(height: 100),
                  OhanaButton(
                    databaseRepository: databaseRepository,
                    text: "Ja",
                    onTap: () {
                      authRepository.logout();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenuScreen(
                                    databaseRepository: databaseRepository,
                                    authRepository: authRepository,
                                  )));
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
