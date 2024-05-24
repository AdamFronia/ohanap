import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';

class Homecenter extends StatelessWidget {
  const Homecenter({super.key, required DatabaseRepository databaseRepository});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft + const Alignment(1.0, 3.2),
          child: Image.asset(
            'assets/ostseebroetchen.png',
            width: 150,
            height: 150,
          ),
        ),
        Positioned(
          right: 80,
          bottom: 0,
          child: Image.asset(
            'assets/papashund.png',
            width: 75,
            height: 75,
          ),
        ),
      ],
    );
  }
}
