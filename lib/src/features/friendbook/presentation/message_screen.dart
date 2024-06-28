import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/messageausgang_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/messageeingang_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/messageschreiben_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/ohanabutton.dart';

class MessageScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
  // Konstruktor
  const MessageScreen(
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
            text: "Schreiben",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessageschreibenScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          const SizedBox(height: 4),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Eingang",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessageeingangScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          const SizedBox(height: 4),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Ausgang",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessageausgangScreen(
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
