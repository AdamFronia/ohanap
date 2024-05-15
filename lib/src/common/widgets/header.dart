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
        const Expanded(
          child: CustomButton(),
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
