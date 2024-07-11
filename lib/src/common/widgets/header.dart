import 'package:flutter/material.dart';
import 'package:ohanap/src/common/widgets/custom_icon_button.dart';
import 'package:ohanap/src/features/menus/presentation/menu_screen.dart';
import 'package:ohanap/src/features/messages/message_screen.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MenuScreen(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
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
              child: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 0, 101, 202),
                size: 20,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageScreen(),
                  ));
            },
            child: const CustomIconButton(icon: Icons.mail_outlined),
          ),
        ),
      ],
    );
  }
}
