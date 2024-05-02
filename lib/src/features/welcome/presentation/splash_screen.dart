import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
          ),
          const Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Willkommen',
                  // style: TextStyle(
                  //   fontSize: 24,
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
