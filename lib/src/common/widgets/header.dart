import 'package:flutter/material.dart';
import 'package:ohanap/src/common/widgets/custom_icon_button.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/menus/presentation/menu_screen.dart';
import 'package:ohanap/src/features/messages/message_screen.dart';

class Header extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const Header(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

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
                  builder: (context) => MenuScreen(
                    databaseRepository: databaseRepository,
                    authRepository: authRepository,
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
                  builder: (context) => MessageScreen(
                    databaseRepository: databaseRepository,
                    authRepository: authRepository,
                  ),
                ),
              );
            },
            child: const CustomIconButton(icon: Icons.mail_outlined),
          ),
        ),
      ],
    );
  }
}
