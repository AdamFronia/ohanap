import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';

class ContributingScreen extends StatelessWidget {
  // Attribute

  // Konstruktor
  const ContributingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
        content: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset(
                'assets/babee.png',
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              const Text(
                'Ramona T.\nFamily Management \nErzieherin',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // "Auge" Button
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
                'assets/Ralf.png',
                width: 55,
                height: 55,
              ),
              const SizedBox(width: 5),
              const Text(
                'Ralf Ingo Magerl\nSoftware Entwickler \nFullstack',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // "Auge" Button
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
                'assets/peggy.jpg',
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              const Text(
                'Peggy´s Bügelperlen\nFamily Management',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                'assets/tvm.jpg',
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              const Text(
                'Thomas von Martinér\nVola Gründer/CEO(App)\nDie Traumfabrik (Gründer/CEO)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // "Auge" Button
            ],
          ),
        ),
      ],
    ));
  }
}
