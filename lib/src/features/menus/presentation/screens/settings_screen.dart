import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/features/menus/presentation/menu_screen.dart';

class SettingsScreen extends StatelessWidget {
  // Attribute

  // Konstruktor
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
        content: Column(
      children: [
        OhanaButton(
          text: "Einstellungen",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MenuScreen()));
          },
        ),
        OhanaButton(
          text: "Hintergrund",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MenuScreen()));
          },
        ),
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
                  'assets/hintergrund1.png',
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
