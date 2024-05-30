import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFA1EFFD),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(4, 0),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
          border: Border.all(color: const Color(0x1C8FE0F3), width: 5),
        ),
        child: Icon(
          icon,
          color: const Color.fromARGB(255, 0, 101, 202),
          size: 20,
        ),
      ),
    );
  }
}
