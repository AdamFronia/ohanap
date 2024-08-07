import 'package:flutter/material.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Funnys extends StatefulWidget {
  const Funnys({super.key});

  @override
  State<Funnys> createState() => _FunnysState();
}

class _FunnysState extends State<Funnys> {
  late DatabaseRepository databaseRepository;
  late TextEditingController controllerfunnys;

  @override
  void initState() {
    super.initState();
    _loadData();
    controllerfunnys = TextEditingController();
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
    return StreamBuilder<Profile>(
      stream: context.read<DatabaseRepository>().getSpecificProfile(userUid!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Profile profile = snapshot.data!;
          return Container(
            width: 250,
            height: 233,
            decoration: ShapeDecoration(
              color: const Color.fromARGB(255, 186, 58, 241),
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
                ),
              ],
            ),
            child: FutureBuilder<List<Profile>>(
              future: context.read<DatabaseRepository>().getAllProfiles(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    controllerfunnys.text = snapshot.data![0].funnys;
                    return Stack(
                      children: [
                        Positioned(
                          right: 100,
                          top: 40,
                          child: Image.asset(
                            'assets/lol.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 25,
                          child: SizedBox(
                            width: 210,
                            child: TextField(
                              controller: controllerfunnys,
                              onSubmitted: (text) async {
                                await context
                                    .read<DatabaseRepository>()
                                    .updateAboutMe("funnys", text, userUid);
                              },
                              style: const TextStyle(
                                color: Colors
                                    .lightBlue, // Schriftfarbe auf LightBlue setzen
                              ),
                              decoration: const InputDecoration(
                                labelText: 'etwas lustiges über mich',
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
                  } else {
                    return const Center(
                      child: Icon(Icons.error),
                    );
                  }
                } else {
                  return const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
