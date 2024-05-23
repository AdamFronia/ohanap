import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';

class Futures extends StatefulWidget {
  const Futures({super.key, required this.databaseRepository});
  final DatabaseRepository databaseRepository;
  @override
  State<Futures> createState() => _FuturesState();
}

class _FuturesState extends State<Futures> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 233,
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 245, 53, 178),
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
            right: 125,
            top: 40,
            child: Image.asset(
              'assets/astronaut.png',
              width: 50,
              height: 50,
            ),
          ),
          const Positioned(
            left: 20,
            bottom: 25,
            child: SizedBox(
              width: 260,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Wo siehst du dich in der Zukunft',
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
      ),
    );
  }
}
