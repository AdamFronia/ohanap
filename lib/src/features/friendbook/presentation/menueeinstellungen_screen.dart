import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/home_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/infozwei_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menuesteckbriefe_screen.dart';

class MenueeinstellungenScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const MenueeinstellungenScreen({super.key, required this.databaseRepository});

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
                        child: CustomButton(
                            // onPressed: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const MenueScreen()),
                            //   );
                            // },
                            ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomIconButton(
                          icon: Icons.mail_outlined,
                          // onPressed: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const MessageScreen()),
                          //   );
                          // }
                        ),
                      ),
                      Spacer(),
                      CustomIconButton(icon: Icons.close),
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
                  const SizedBox(height: 4),

                  buildMenuButton(context, 'Einstellungen'),
                  buildMenuButton(context, 'Hintergrund '),
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
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/download.png',
                            width: 140,
                            height: 140,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Image.asset(
                            'assets/hintergrund1.png',
                            width: 140,
                            height: 140,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 322),

                  // Kleiner Container mit Bild und Name "User"

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
                        buildSmallButton('note', databaseRepository, context),
                        buildSmallButton(
                            'features', databaseRepository, context),
                        buildSmallButton('home', databaseRepository, context),
                        buildSmallButton('users', databaseRepository, context),
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
}
