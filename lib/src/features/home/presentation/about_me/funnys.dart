import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';

class Funnys extends StatefulWidget {
  const Funnys({super.key, required this.databaseRepository});
  final DatabaseRepository databaseRepository;
  @override
  State<Funnys> createState() => _FunnysState();
}

class _FunnysState extends State<Funnys> {
  @override
  Widget build(BuildContext context) {
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
                      decoration: InputDecoration(
                        labelText: 'etwas lustiges über mich',
                        hintText: snapshot.data![0].funnys,
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
