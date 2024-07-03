import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';

class Favorites extends StatefulWidget {
  const Favorites({
    super.key,
    required this.databaseRepository,
  });
  final DatabaseRepository databaseRepository;
  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
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
        future: widget.databaseRepository.getAllProfiles(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            // FALL: Future ist komplett und hat Daten!
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
                      decoration: InputDecoration(
                        labelText: 'Essen',
                        hintText: snapshot.data![0].essen,
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: const UnderlineInputBorder(
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
                      decoration: InputDecoration(
                        labelText: 'Getränk',
                        hintText: snapshot.data![0].getraenke,
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: const UnderlineInputBorder(
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
                      decoration: InputDecoration(
                        labelText: 'Musik',
                        hintText: snapshot.data![0].musik,
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: const UnderlineInputBorder(
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
                      decoration: InputDecoration(
                        labelText: 'Tier',
                        hintText: snapshot.data![0].tier,
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: const UnderlineInputBorder(
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
                  height: 20, width: 20, child: CircularProgressIndicator()),
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
