import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://via.placeholder.com/473x932',
                  width: 373,
                  height: 532,
                ),
                Image.network(
                  'https://via.placeholder.com/390x459',
                  width: 290,
                  height: 259,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 293,
              height: 210,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF00D7FF),
                    Color(0x2400D7FF), // 14% Opacity
                    Color(0x0000D7FF), // 0% Opacity
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
