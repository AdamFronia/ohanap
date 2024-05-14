import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/home_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/infoeins_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/infozwei_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/message_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/user_screen.dart';

class MessageausgangScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const MessageausgangScreen({super.key, required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/hintergrund1.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topLeft + const Alignment(0.1, 0.4),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Row(
                    children: [
                      Expanded(
                        child: CustomButton(),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomIconButton(
                          icon: Icons.mail_outlined,
                        ),
                      ),
                      Spacer(),
                      CustomIconButton(
                        icon: Icons.close,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: 160,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21, vertical: 10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFA1EFFD),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 5, color: Color(0x19000000)),
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
                            builder: (context) => MessageScreen(
                              databaseRepository: databaseRepository,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21, vertical: 10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFA1EFFD),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 5, color: Color(0x19000000)),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21, vertical: 10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFA1EFFD),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 5, color: Color(0x19000000)),
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
                  const SizedBox(height: 335),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSmallButton(context, 'note'),
                        buildSmallButton(context, 'features'),
                        buildSmallButton(context, 'home'),
                        buildSmallButton(context, 'users'),
                        GestureDetector(
                          onTap: () {
                            // Implementieren Sie die Aktion für den Stern-Button
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.transparent, // Farbe anpassen
                              borderRadius: BorderRadius.circular(50),
                              // Schatten und andere Eigenschaften anpassen
                            ),
                            child: const Icon(
                              Icons.star,
                              color: Colors.black, // Farbe anpassen
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSmallButton(BuildContext context, String icon) {
    IconData? buttonIcon;
    Function()? onPressed;

    switch (icon) {
      case 'note':
        buttonIcon = Icons.last_page;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InfozweiScreen(
                      databaseRepository: databaseRepository,
                    )), // Navigiere zum InfozweiScreen
          ); // Implementieren Sie die Aktion für die entsprechende Taste
        };
        break;
      case 'features':
        buttonIcon = Icons.first_page;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InfoeinsScreen(
                      databaseRepository: databaseRepository,
                    )), // Navigiere zum InfoeinsScreen
          ); // Implementieren Sie die Aktion für die entsprechende Taste
        };
        break;
      case 'home':
        buttonIcon = Icons.home_outlined;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      databaseRepository: databaseRepository,
                    )),
          );
        };
        break;
      case 'users':
        buttonIcon = Icons.add_circle_outline;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserScreen(
                      databaseRepository: databaseRepository,
                    )),
          ); // Implementieren Sie die Aktion für die entsprechende Taste
        };
        break;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 78, 171, 253),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(4, 0),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Icon(
          buttonIcon,
          color: const Color.fromARGB(255, 0, 101, 202),
          size: 40,
        ),
      ),
    );
  }
}
