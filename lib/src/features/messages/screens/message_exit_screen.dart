import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/messages/screens/message_write_screen.dart';

class MessageExitScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
  // Konstruktor
  const MessageExitScreen(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
        databaseRepository: databaseRepository,
        authRepository: authRepository,
        content: Column(
          children: [
            Container(
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
                onTap: () {
                  // Navigiere zum MessageeingangScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WriteMessageScreen(
                        databaseRepository: databaseRepository,
                        authRepository: authRepository,
                      ),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    'Ausgang',
                    style: TextStyle(
                      color: Color(0xFF0B4BA4),
                      fontSize: 16,
                      fontFamily: 'SF Pro Rounded',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: 372,
              height: 100,
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
              child: const Center(
                child: Text(
                  'Nachricht von User XY',
                  style: TextStyle(
                    color: Color(0xFF0B4BA4),
                    fontSize: 16,
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              width: 372,
              height: 100,
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
              child: const Center(
                child: Text(
                  'Nachricht von User XYZ',
                  style: TextStyle(
                    color: Color(0xFF0B4BA4),
                    fontSize: 16,
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
