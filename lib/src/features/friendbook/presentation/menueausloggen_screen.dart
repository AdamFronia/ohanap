import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/menue_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/ohanabutton.dart';

class MenueausloggenScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
  // Konstruktor
  const MenueausloggenScreen(
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
              text: "Account",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenueScreen(
                              databaseRepository: databaseRepository,
                              authRepository: authRepository,
                            )));
              },
            ),
            Ohanabutton(
              databaseRepository: databaseRepository,
              text: "löschen",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenueScreen(
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
                  Ohanabutton(
                    databaseRepository: databaseRepository,
                    text: "Nein",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenueScreen(
                                    databaseRepository: databaseRepository,
                                    authRepository: authRepository,
                                  )));
                    },
                  ),
                  const SizedBox(height: 100),
                  Ohanabutton(
                    databaseRepository: databaseRepository,
                    text: "Ja",
                    onTap: () {
                      authRepository.logout();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenueScreen(
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
