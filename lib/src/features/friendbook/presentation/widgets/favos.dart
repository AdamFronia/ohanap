import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';

class Favos extends StatefulWidget {
  const Favos({
    super.key,
    required this.databaseRepository,
  });
  final DatabaseRepository databaseRepository;
  @override
  State<Favos> createState() => _FavosState();
}

class _FavosState extends State<Favos> {
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
      child: Stack(
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
          const Positioned(
            left: 20,
            bottom: 220,
            child: SizedBox(
              width: 140,
              child: TextField(
                decoration: InputDecoration(
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
          const Positioned(
            left: 20,
            bottom: 160,
            child: SizedBox(
              width: 140,
              child: TextField(
                decoration: InputDecoration(
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
          const Positioned(
            left: 20,
            bottom: 100,
            child: SizedBox(
              width: 140,
              child: TextField(
                decoration: InputDecoration(
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
          const Positioned(
            left: 20,
            bottom: 40,
            child: SizedBox(
              width: 140,
              child: TextField(
                decoration: InputDecoration(
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
      ),
    );
  }
}
