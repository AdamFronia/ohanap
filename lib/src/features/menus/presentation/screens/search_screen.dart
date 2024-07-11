import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/features/menus/presentation/menu_screen.dart';

class SearchScreen extends StatelessWidget {
  // Attribute

  // Konstruktor
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
        content: Column(
      children: [
        OhanaButton(
          text: "Suche",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MenuScreen()));
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
