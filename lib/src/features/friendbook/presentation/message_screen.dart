import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/messageausgang_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/messageeingang_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/messageschreiben_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/ohanabutton.dart';

class MessageScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const MessageScreen({super.key, required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      databaseRepository: databaseRepository,
      content: Column(
        children: [
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Schreiben",
            destination: MessageschreibenScreen(
              databaseRepository: databaseRepository,
            ),
          ),
          const SizedBox(height: 4),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Eingang",
            destination: MessageeingangScreen(
              databaseRepository: databaseRepository,
            ),
          ),
          const SizedBox(height: 4),
          Ohanabutton(
            databaseRepository: databaseRepository,
            text: "Ausgang",
            destination: MessageausgangScreen(
              databaseRepository: databaseRepository,
            ),
          ),
        ],
      ),
    );
  }
}
