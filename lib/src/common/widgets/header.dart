import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/infozwei_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/message_screen.dart';

class Header extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  const Header({super.key, required this.databaseRepository});

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
                  builder: (context) => MessageScreen(
                    databaseRepository: databaseRepository,
                  ),
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
              child: const Text(
                'Menü',
                style: TextStyle(
                  color: Color(0xFF0C4CA4),
                  fontSize: 18,
                  fontFamily: 'SF Pro Rounded',
                  fontWeight: FontWeight.w400,
                ),
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
                  builder: (context) => MessageScreen(
                    databaseRepository: databaseRepository,
                  ),
                ),
              );
            },
            child: const CustomIconButton(icon: Icons.mail_outlined),
          ),
        ),
        const Spacer(),
        const CustomIconButton(
          icon: Icons.close,
          // onPressed: () {
          //   SystemNavigator.pop(); // Beenden der App
          // },
        ),
      ],
    );
  }
}
