import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';

class Goodys extends StatefulWidget {
  const Goodys({super.key, required this.databaseRepository});
  final DatabaseRepository databaseRepository;
  @override
  State<Goodys> createState() => _GoodysState();
}

class _GoodysState extends State<Goodys> {
  @override
  Widget build(BuildContext context) {
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
          const Positioned(
            left: 20,
            bottom: 25,
            child: SizedBox(
              width: 210,
              child: TextField(
                decoration: InputDecoration(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
