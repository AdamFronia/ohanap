import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';

class Aboutme extends StatefulWidget {
  const Aboutme({super.key, required this.databaseRepository});

  final DatabaseRepository databaseRepository;
  @override
  State<Aboutme> createState() => _AboutmeState();
}

class _AboutmeState extends State<Aboutme> {
  @override
  Widget build(BuildContext context) {
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
          const Positioned(
            left: 20,
            bottom: 25,
            child: SizedBox(
              width: 210,
              child: TextField(
                decoration: InputDecoration(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
