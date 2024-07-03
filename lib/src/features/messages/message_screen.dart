import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/messages/screens/message_exit_screen.dart';
import 'package:ohanap/src/features/messages/screens/message_write_screen.dart';

import 'screens/message_entrance_screen.dart';

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
          OhanaButton(
            databaseRepository: databaseRepository,
            text: "Schreiben",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WriteMessageScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          const SizedBox(height: 4),
          OhanaButton(
            databaseRepository: databaseRepository,
            text: "Eingang",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessageEntranceScreen(
                      databaseRepository: databaseRepository,
                      authRepository: authRepository,
                    ),
                  ));
            },
          ),
          const SizedBox(height: 4),
          OhanaButton(
            databaseRepository: databaseRepository,
            text: "Ausgang",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessageExitScreen(
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
