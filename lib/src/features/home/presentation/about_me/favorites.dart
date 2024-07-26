import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorites extends StatefulWidget {
  const Favorites({
    super.key,
  });

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late TextEditingController controllerFood;
  late TextEditingController controllerDrink;
  late TextEditingController controllerMusik;
  late TextEditingController controllerAnimal;
  @override
  void initState() {
    super.initState();
    _loadData();
    controllerFood = TextEditingController();
    controllerDrink = TextEditingController();
    controllerMusik = TextEditingController();
    controllerAnimal = TextEditingController();
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
              width: 220,
              height: 330,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 47, 181, 23),
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
              child: FutureBuilder(
                future: context.read<DatabaseRepository>().getAllProfiles(),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    // FALL: Future ist komplett und hat Daten!
                    controllerFood.text = snapshot.data![0].essen;
                    controllerDrink.text = snapshot.data![0].drink;
                    controllerMusik.text = snapshot.data![0].musik;
                    controllerAnimal.text = snapshot.data![0].animal;
                    return Stack(
                      children: [
                        Positioned(
                          right: 80,
                          top: 10,
                          child: Image.asset(
                            'assets/love.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 220,
                          child: SizedBox(
                            width: 140,
                            child: TextField(
                              controller: controllerFood,
                              onSubmitted: (text) async {
                                await context
                                    .read<DatabaseRepository>()
                                    .updateAboutMe(
                                      "essen",
                                      text,
                                    );
                              },
                              decoration: const InputDecoration(
                                labelText: 'Essen',
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
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 160,
                          child: SizedBox(
                            width: 140,
                            child: TextField(
                              controller: controllerDrink,
                              onSubmitted: (text) async {
                                await context
                                    .read<DatabaseRepository>()
                                    .updateAboutMe(
                                      "Getraenke",
                                      text,
                                    );
                              },
                              decoration: const InputDecoration(
                                labelText: 'Getränk',
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
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 100,
                          child: SizedBox(
                            width: 140,
                            child: TextField(
                              controller: controllerMusik,
                              onSubmitted: (text) async {
                                await context
                                    .read<DatabaseRepository>()
                                    .updateAboutMe(
                                      "musik",
                                      text,
                                    );
                              },
                              decoration: const InputDecoration(
                                labelText: 'Musik',
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
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 40,
                          child: SizedBox(
                            width: 140,
                            child: TextField(
                              controller: controllerAnimal,
                              onSubmitted: (text) async {
                                await context
                                    .read<DatabaseRepository>()
                                    .updateAboutMe(
                                      "tier",
                                      text,
                                    );
                              },
                              decoration: const InputDecoration(
                                labelText: 'Tier',
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
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.connectionState != ConnectionState.done) {
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
                },
              ));
        } else {
          return Container();
        }
      },
    );
  }
}
