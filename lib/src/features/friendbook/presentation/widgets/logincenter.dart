import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';

class Logincenter extends StatelessWidget {
  const Logincenter(
      {super.key, required DatabaseRepository databaseRepository});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(bottom: 508),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/Bildschirmfoto.png',
          ),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0EECFA),
            Color(0x821697D7),
          ],
        ),
      ),
    );
  }
}
