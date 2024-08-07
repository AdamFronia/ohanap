import 'package:flutter/material.dart';

class OhanaButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const OhanaButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFA1EFFD),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 5, color: Color(0x19000000)),
          borderRadius: BorderRadius.circular(28),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(1, 1),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(-1, -1),
            spreadRadius: 0,
          )
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 16,
              fontFamily: 'SF Pro Rounded',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
