import 'package:flutter/material.dart';
import 'package:ohanap/src/features/friendbook/presentation/home_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/infoeins_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/infozwei_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/menue_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/message_screen.dart'; // Importieren Sie das MessageScreen
import 'package:ohanap/src/features/friendbook/presentation/user_screen.dart';

class MenuesteckbriefeScreen extends StatelessWidget {
  const MenuesteckbriefeScreen({
    super.key,
  });

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
                      Expanded(
                        child: CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MenueScreen()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomIconButton(
                            icon: Icons.mail_outlined,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MessageScreen()),
                              );
                            }),
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

                  _buildMenuButton(context, 'Steckbriefe'),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  // Eingabefeld für Suche
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/ostseebroetchen.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'User',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(), // Fügt Raum zwischen "User" und den neuen Buttons hinzu

                        const SizedBox(width: 10),
                        const CustomIconButton(
                            icon: Icons.visibility), // "Auge" Button
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/ostseebroetchen.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'User',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(), // Fügt Raum zwischen "User" und den neuen Buttons hinzu

                        const SizedBox(width: 10),
                        const CustomIconButton(
                            icon: Icons.visibility), // "Auge" Button
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/ostseebroetchen.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'User',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(), // Fügt Raum zwischen "User" und den neuen Buttons hinzu

                        const SizedBox(width: 10),
                        const CustomIconButton(
                            icon: Icons.visibility), // "Auge" Button
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/ostseebroetchen.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'User',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(), // Fügt Raum zwischen "User" und den neuen Buttons hinzu

                        const SizedBox(width: 10),
                        const CustomIconButton(
                            icon: Icons.visibility), // "Auge" Button
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/ostseebroetchen.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'User',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(), // Fügt Raum zwischen "User" und den neuen Buttons hinzu

                        const SizedBox(width: 10),
                        const CustomIconButton(
                            icon: Icons.visibility), // "Auge" Button
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(height: 195),

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
                        _buildSmallButton(context, 'note'),
                        _buildSmallButton(context, 'features'),
                        _buildSmallButton(context, 'home'),
                        _buildSmallButton(context, 'users'),
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

  Widget _buildMenuButton(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenueScreen()),
            );
          },
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
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
    );
  }

  Widget _buildSmallButton(BuildContext context, String icon) {
    IconData? buttonIcon;
    Function()? onPressed;

    switch (icon) {
      case 'note':
        buttonIcon = Icons.last_page;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InfozweiScreen()),
          );
        };
        break;
      case 'features':
        buttonIcon = Icons.first_page;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InfoeinsScreen()),
          );
        };
        break;
      case 'home':
        buttonIcon = Icons.home_outlined;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        };
        break;
      case 'users':
        buttonIcon = Icons.add_circle_outline;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserScreen()),
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

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: InkWell(
        onTap: onPressed,
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
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomIconButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: InkWell(
        onTap: onPressed,
        child: Icon(
          icon,
          color: const Color(0xFF0C4CA4),
          size: 20,
        ),
      ),
    );
  }
}
