import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/personal_container.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({
    super.key,
  });

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
    final authRepository = context.read<AuthRepository>();
    final userUid = authRepository.getCurrentUser()?.uid;
    return StreamBuilder(
      stream: context.read<DatabaseRepository>().getSpecificProfile(userUid!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Profile profile = snapshot.data!;
          log(profile.holiday);
          log(profile.job);
          return TemplateScreen(
            content: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PersonalContainer(
                        assetPath: 'assets/mental-health.png',
                        text: "Lieblingshobby",
                        color: Colors.blue,
                        firestoreKey: "hobby",
                        value: profile.hobby,
                        textStyle: TextStyle(
                            color: Colors.blue.shade900), // Schriftfarbe
                      ),
                      const SizedBox(width: 5),
                      PersonalContainer(
                        assetPath: 'assets/summer-holidays.png',
                        text: "LiebstUrlaubsort",
                        color: Colors.orange,
                        firestoreKey: "holiday",
                        value: profile.holiday,
                        textStyle: TextStyle(
                            color: Colors.blue.shade900), // Schriftfarbe
                      ),
                      const SizedBox(width: 5),
                      PersonalContainer(
                        assetPath: 'assets/businessman.png',
                        text: "Beruf",
                        color: Colors.purple,
                        firestoreKey: "job",
                        value: profile.job,
                        textStyle: TextStyle(
                            color: Colors.blue.shade900), // Schriftfarbe
                      ),
                      const SizedBox(width: 5),
                      PersonalContainer(
                        assetPath: 'assets/astronaut.png',
                        text: "Wunschberuf",
                        color: Colors.pink,
                        firestoreKey: "wishJob",
                        value: profile.wishJob,
                        textStyle: TextStyle(
                            color: Colors.blue.shade900), // Schriftfarbe
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PersonalContainer(
                        assetPath: 'assets/astronaut.png',
                        text: "Lieblingsfarbe",
                        color: Colors.cyanAccent,
                        firestoreKey: "color",
                        value: profile.color.toString(),
                        textStyle: TextStyle(
                            color: Colors.blue.shade900), // Schriftfarbe
                      ),
                      const SizedBox(width: 5),
                      PersonalContainer(
                        assetPath: 'assets/birthday-cake.png',
                        text: "Geburtsdatum",
                        color: Colors.yellow,
                        firestoreKey: "birthdate",
                        value: profile.birthdate,
                        textStyle: TextStyle(
                            color: Colors.blue.shade900), // Schriftfarbe
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
                PersonalContainer(
                  assetPath: 'assets/astronaut.png',
                  text: "Schlafenszeit",
                  color: Colors.deepPurple,
                  firestoreKey: "sleepTime",
                  value: profile.sleepTime,
                  textStyle:
                      TextStyle(color: Colors.blue.shade900), // Schriftfarbe
                ),
              ],
            ),
          );
        } else if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const Icon(Icons.error);
        }
      },
    );
  }
}
