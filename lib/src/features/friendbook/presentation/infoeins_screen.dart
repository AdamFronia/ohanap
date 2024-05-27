import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/personal_container.dart';

class InfoeinsScreen extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  const InfoeinsScreen({super.key, required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      databaseRepository: databaseRepository,
      content: Column(
        children: [
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PersonalContainer(
                  assetPath: 'assets/mental-health.png',
                  text: "Lieblingshobby",
                  color: Colors.blue,
                ),
                SizedBox(width: 5),
                PersonalContainer(
                  assetPath: 'assets/summer-holidays.png',
                  text: "LiebstUrlaubsort",
                  color: Colors.orange,
                ),
                SizedBox(width: 5),
                PersonalContainer(
                  assetPath: 'assets/businessman.png',
                  text: "Beruf",
                  color: Colors.purple,
                ),
                SizedBox(width: 5),
                PersonalContainer(
                  assetPath: 'assets/astronaut.png',
                  text: "Wunschberuf",
                  color: Colors.pink,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(
              color: Color.fromARGB(255, 0, 0, 0),
              thickness: 1,
            ),
          ),
          const SizedBox(height: 3),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PersonalContainer(
                  assetPath: 'assets/astronaut.png',
                  text: "Lieblingsfarbe",
                  color: Colors.cyanAccent,
                ),
                SizedBox(width: 5),
                PersonalContainer(
                  assetPath: 'assets/birthday-cake.png',
                  text: "Geburtsdatum",
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(
              color: Color.fromARGB(255, 0, 0, 0),
              thickness: 1,
            ),
          ),
          const SizedBox(height: 3),
          const PersonalContainer(
            assetPath: 'assets/astronaut.png',
            text: "Schlafenszeit",
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}
