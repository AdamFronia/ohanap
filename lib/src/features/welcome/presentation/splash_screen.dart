// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ohanap/src/features/authentication_manager/presentation/authentication_manager_screen.dart';

class SplashScreen extends StatefulWidget {
  // Konstruktor
  const SplashScreen({
    super.key,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const AuthenticationManagerScreen(),
      ));
    });
  }

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
                  '''

Willkommen 
bei
Ohana

Ohana heißt 
Familie 
&         
Familie heißt
zusammen''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
