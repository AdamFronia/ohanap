import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/home_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/infozwei_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menuesteckbriefe_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/message_screen.dart';

class MenueScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const MenueScreen({super.key, required this.databaseRepository});

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
                  Row(
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
                                ), // Öffne MessageScreen
                              ),
                            );
                          },
                          child:
                              const CustomIconButton(icon: Icons.mail_outlined),
                        ),
                      ),
                      const Spacer(),
                      const CustomIconButton(icon: Icons.close),
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

                  buildMenuButton(context, 'Suche'),
                  buildMenuButton(context, 'Steckbriefe'),
                  buildMenuButton(context, 'Gallerie'),
                  buildMenuButton(context, 'Einstellungen'),
                  buildMenuButton(context, 'Blockliste'),
                  buildMenuButton(context, 'QR-Code'),
                  buildMenuButton(context, 'Mitwirkende'),
                  buildMenuButton(context, 'Admins'),
                  buildMenuButton(context, 'Kontaktinfos'),
                  buildMenuButton(context, 'Impressum'),
                  buildMenuButton(context, 'Ausloggen'),

                  // Kleiner Container mit Bild und Name "User"

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
