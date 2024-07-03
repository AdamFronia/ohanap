import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/menus/presentation/menu_screen.dart';

class GalleryScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
  // Konstruktor
  const GalleryScreen(
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
                text: "Gallerie",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenuScreen(
                              databaseRepository: databaseRepository,
                              authRepository: authRepository,
                            )),
                  );
                }),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Divider(
                color: Color.fromARGB(255, 0, 0, 0),
                thickness: 1,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/download.png',
                      width: 140,
                      height: 140,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Image.asset(
                      'assets/ostseebroetchen.png',
                      width: 140,
                      height: 140,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/ostseebroetchen.png',
                      width: 140,
                      height: 140,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Image.asset(
                      'assets/ostseebroetchen.png',
                      width: 140,
                      height: 140,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/ostseebroetchen.png',
                      width: 140,
                      height: 140,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Image.asset(
                      'assets/ostseebroetchen.png',
                      width: 140,
                      height: 140,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
