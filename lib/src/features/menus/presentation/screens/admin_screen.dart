import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/custom_icon_button.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/features/menus/presentation/menu_screen.dart';

class AdminScreen extends StatelessWidget {
  // Attribute

  // Konstruktor
  const AdminScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
        content: Column(
      children: [
        OhanaButton(
          text: "Admins",
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
        // Eingabefeld für Suche
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset(
                'assets/ostseebroetchen.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              const Text(
                'User',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(), // Fügt Raum zwischen "User" und den neuen Buttons hinzu

              const SizedBox(width: 10),
              const CustomIconButton(icon: Icons.visibility), // "Auge" Button
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Divider(
            color: Color.fromARGB(255, 0, 0, 0),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset(
                'assets/ostseebroetchen.png',
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              const Text(
                'User',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(), // Fügt Raum zwischen "User" und den neuen Buttons hinzu

              const SizedBox(width: 10),
              const CustomIconButton(icon: Icons.visibility), // "Auge" Button
            ],
          ),
        )
      ],
    ));
  }
}
