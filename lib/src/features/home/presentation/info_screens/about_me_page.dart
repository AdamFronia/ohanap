import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/personal_container.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutMePage extends StatefulWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const AboutMePage(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await SharedPreferences.getInstance();
  }

  Future<void> _saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      databaseRepository: widget.databaseRepository,
      authRepository: widget.authRepository,
      content: FutureBuilder(
        future: widget.databaseRepository.getAllProfiles(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            // FALL: Future ist komplett und hat Daten!
            return Column(
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
                const SizedBox(height: 1),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1,
                  ),
                ),
                const SizedBox(height: 1),
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
                const SizedBox(height: 1),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Divider(
                    color: Color.fromARGB(255, 0, 0, 0),
                    thickness: 1,
                  ),
                ),
                const SizedBox(height: 2),
                const PersonalContainer(
                  assetPath: 'assets/astronaut.png',
                  text: "Schlafenszeit",
                  color: Colors.deepPurple,
                ),
              ],
            );
          } else if (snapshot.connectionState != ConnectionState.done) {
            // FALL: Sind noch im Ladezustand
            return const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            // FALL: Es gab nen Fehler
            return const Icon(Icons.error);
          }
        },
      ),
    );
  }
}
