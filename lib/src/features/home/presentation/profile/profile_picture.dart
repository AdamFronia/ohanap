import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

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
