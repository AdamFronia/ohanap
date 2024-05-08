import 'package:flutter/material.dart';
import 'package:ohanap/src/features/friendbook/presentation/home_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/infozwei_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/user_screen.dart';

class InfoeinsScreen extends StatelessWidget {
  const InfoeinsScreen({
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
                  const Row(
                    children: [
                      Expanded(
                        child: CustomButton(),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomIconButton(icon: Icons.mail_outlined),
                      ),
                      Spacer(),
                      CustomIconButton(icon: Icons.close),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(height: 3),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 38, 142, 247),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 65,
                                top: 40,
                                child: Image.asset(
                                  'assets/mental-health.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              const Positioned(
                                left: 20,
                                bottom: 25,
                                child: SizedBox(
                                  width: 140,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Lieblingshobby',
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 180,
                          height: 180,
                          decoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 241, 119, 31),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 65,
                                top: 40,
                                child: Image.asset(
                                  'assets/summer-holidays.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              const Positioned(
                                left: 20,
                                bottom: 25,
                                child: SizedBox(
                                  width: 140,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'LiebstUrlaubsort',
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 180,
                          height: 180,
                          decoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 186, 58, 241),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 65,
                                top: 40,
                                child: Image.asset(
                                  'assets/businessman.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              const Positioned(
                                left: 20,
                                bottom: 25,
                                child: SizedBox(
                                  width: 140,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Beruf',
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 180,
                          height: 180,
                          decoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 245, 53, 178),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 65,
                                top: 40,
                                child: Image.asset(
                                  'assets/astronaut.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              const Positioned(
                                left: 20,
                                bottom: 25,
                                child: SizedBox(
                                  width: 140,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Wunsch-Beruf',
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        decoration: ShapeDecoration(
                          color: const Color.fromARGB(255, 201, 238, 243),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 65,
                              top: 40,
                              child: Image.asset(
                                'assets/wheel.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const Positioned(
                              left: 20,
                              bottom: 25,
                              child: SizedBox(
                                width: 140,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Lieblingsfarbe',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 180,
                        height: 180,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFECC4C),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 65,
                              top: 40,
                              child: Image.asset(
                                'assets/birthday-cake.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const Positioned(
                              left: 20,
                              bottom: 25,
                              child: SizedBox(
                                width: 140,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Geburtsdatum',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                  const SizedBox(height: 3),
                  const SizedBox(width: 5),
                  Container(
                    width: 180,
                    height: 180,
                    decoration: ShapeDecoration(
                      color: const Color.fromARGB(255, 135, 46, 230),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 65,
                          top: 40,
                          child: Image.asset(
                            'assets/sleep.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const Positioned(
                          left: 25,
                          bottom: 25,
                          child: SizedBox(
                            width: 140,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Schlafenszeit',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 14,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w400,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                            // Implementiere die Aktion für den Stern-Button
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.star,
                              color: Colors.black,
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
          );
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
  const CustomButton({
    super.key,
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
      child: const Text(
        'Menü',
        style: TextStyle(
          color: Color(0xFF0C4CA4),
          fontSize: 18,
          fontFamily: 'SF Pro Rounded',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;

  const CustomIconButton({super.key, required this.icon});

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
      child: Icon(
        icon,
        color: const Color(0xFF0C4CA4),
        size: 20,
      ),
    );
  }
}
