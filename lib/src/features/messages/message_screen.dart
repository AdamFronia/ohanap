import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/features/messages/screens/message_exit_screen.dart';
import 'package:ohanap/src/features/messages/screens/message_write_screen.dart';

import 'screens/message_entrance_screen.dart';

class MessageScreen extends StatelessWidget {
  // Attribute

  // Konstruktor
  const MessageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      content: Column(
        children: [
          OhanaButton(
            text: "Schreiben",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WriteMessageScreen(),
                  ));
            },
          ),
          const SizedBox(height: 4),
          OhanaButton(
            text: "Eingang",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageEntranceScreen(),
                  ));
            },
          ),
          const SizedBox(height: 4),
          OhanaButton(
            text: "Ausgang",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageExitScreen(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
