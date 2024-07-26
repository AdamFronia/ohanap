import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({
    super.key,
  });

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  late DatabaseRepository databaseRepository;
  late TextEditingController controlleraboutme;
  @override
  void initState() {
    super.initState();
    _loadData();
    controlleraboutme = TextEditingController();
    databaseRepository = context.read<DatabaseRepository>();
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
    return StreamBuilder(
        stream: context
            .read<DatabaseRepository>()
            .getSpecificProfile("l75mGuGI0dKtUKMWQ6m5"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Profile profile = snapshot.data!;
            return Container(
              width: 250,
              height: 233,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 38, 142, 247),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 100,
                    top: 40,
                    child: Image.asset(
                      'assets/personality.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 25,
                    child: SizedBox(
                      width: 210,
                      child: FutureBuilder(
                          future: databaseRepository.getAllProfiles(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState ==
                                    ConnectionState.done) {
                              // FALL: Future ist komplett und hat Daten!
                              controlleraboutme.text =
                                  snapshot.data![0].aboutMe;
                              return TextField(
                                controller: controlleraboutme,
                                onSubmitted: (text) async {
                                  await context
                                      .read<DatabaseRepository>()
                                      .updateAboutMe(
                                        "aboutMe",
                                        text,
                                      );
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Über mich',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              );
                            } else if (snapshot.connectionState !=
                                ConnectionState.done) {
                              // FALL: Sind noch im Ladezustand
                              return const Center(
                                child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator()),
                              );
                            } else {
                              // FALL: Es gab nen Fehler
                              return const Icon(Icons.error);
                            }
                          }),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
