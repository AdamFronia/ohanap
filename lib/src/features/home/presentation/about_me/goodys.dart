import 'package:flutter/material.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Goodys extends StatefulWidget {
  const Goodys({
    super.key,
  });

  @override
  State<Goodys> createState() => _GoodysState();
}

class _GoodysState extends State<Goodys> {
  late DatabaseRepository databaseRepository;
  late TextEditingController controllergoodies;
  @override
  void initState() {
    super.initState();
    _loadData();
    controllergoodies = TextEditingController();
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
    final authRepository = context.read<AuthRepository>();
    final userUid = authRepository.getCurrentUser()?.uid;
    return StreamBuilder(
        stream: context.read<DatabaseRepository>().getSpecificProfile(userUid!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Profile profile = snapshot.data!;
            return Container(
              width: 250,
              height: 233,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 241, 119, 31),
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
                      'assets/endorsement.png',
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
                              controllergoodies.text =
                                  snapshot.data![0].goodies;
                              return TextField(
                                controller: controllergoodies,
                                onSubmitted: (text) async {
                                  await context
                                      .read<DatabaseRepository>()
                                      .updateAboutMe(
                                        "goodies",
                                        text,
                                      );
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Das kann ich besonders gut',
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
