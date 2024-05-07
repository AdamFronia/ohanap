import 'package:flutter/material.dart';
import 'package:ohanap/src/features/friendbook/presentation/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String selectedEmoji = '';
  late String location = '';
  bool isStarSelected = false;

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
                  const SizedBox(
                    height: 40,
                  ), // Platz für die Verschiebung nach unten
                  const Row(
                    children: [
                      Expanded(
                        child: CustomButton(),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomIconButton(icon: Icons.mail_outlined),
                      ),
                      Spacer(), // Füllt den verbleibenden Platz aus
                      CustomIconButton(icon: Icons.close),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ), // Platz für den Divider
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ), // Abstand zwischen Button und Bild erhöht
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft +
                            const Alignment(1.0,
                                3.2), // Verschiebung des Bildes nach rechts und unten
                        child: Image.asset(
                          'assets/ostseebroetchen.png', // Hier das Bild einfügen
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Positioned(
                        right: 80,
                        bottom: 0,
                        child: Image.asset(
                          'assets/papashund.png', // Hier das zweite Bild einfügen
                          width: 75,
                          height: 75,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ), // Platz für das TextFormField
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Lies mich',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                          color: Colors
                              .black), // Schriftfarbe des Labels auf Schwarz setzen
                      hintStyle: TextStyle(
                          color: Colors
                              .black), // Schriftfarbe des Hinweistexts auf Schwarz setzen
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .black), // Farbe der aktivierten Rahmenlinie auf Schwarz setzen
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .black), // Farbe der fokussierten Rahmenlinie auf Schwarz setzen
                      ),
                    ),
                    style: const TextStyle(
                        color: Colors
                            .black), // Schriftfarbe des Textes im TextFormField auf Schwarz setzen
                  ),
                  const SizedBox(
                    height: 20,
                  ), // Platz für das Emojicontainer
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (1).png',
                          selected: selectedEmoji == 'assets/superhero (1).png',
                        ),
                        const SizedBox(
                            width: 10), // Abstand zwischen den Emojis
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (2).png',
                          selected: selectedEmoji == 'assets/superhero (2).png',
                        ),
                        const SizedBox(
                            width: 10), // Abstand zwischen den Emojis
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (3).png',
                          selected: selectedEmoji == 'assets/superhero (3).png',
                        ),
                        const SizedBox(
                            width: 10), // Abstand zwischen den Emojis
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (4).png',
                          selected: selectedEmoji == 'assets/superhero (4).png',
                        ),
                        const SizedBox(
                            width: 10), // Abstand zwischen den Emojis
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (5).png',
                          selected: selectedEmoji == 'assets/superhero (5).png',
                        ),
                        const SizedBox(
                            width: 10), // Abstand zwischen den Emojis
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero.png',
                          selected: selectedEmoji == 'assets/superhero.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ), // Platz für den neuen Container
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA1EFFD),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Beziehungsstatus',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Gib deinen Beziehungsstatus ein',
                            labelStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ), // Platz für den weiteren Container
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Wohne in der Stadt/dem Land',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Gib deine Adresse ein',
                            labelStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          onChanged: (value) {
                            setState(() {
                              location = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ), // Platz für den Divider
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ), // Platz für die kleinen Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSmallButton('note'),
                        _buildSmallButton('features'),
                        _buildSmallButton('home'),
                        _buildSmallButton('users'),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isStarSelected = !isStarSelected;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isStarSelected
                                  ? const Color.fromARGB(255, 14, 216, 252)
                                  : null,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.star,
                              color: isStarSelected ? Colors.black : null,
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

  Widget _buildEmojiContainer({
    required String assetPath,
    required bool selected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedEmoji = selected ? '' : assetPath;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: selected
              ? const Color.fromARGB(255, 12, 158, 168)
              : Colors.transparent,
        ),
        child: Image.asset(assetPath, fit: BoxFit.contain),
      ),
    );
  }

  Widget _buildSmallButton(String icon) {
    IconData? buttonIcon;
    Function()? onTap;

    switch (icon) {
      case 'note':
        buttonIcon = Icons.last_page;
        break;
      case 'features':
        buttonIcon = Icons.first_page;
        break;
      case 'home':
        buttonIcon = Icons.home_outlined;
        break;
      case 'users':
        buttonIcon = Icons.add_circle_outline;
        onTap = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserScreen()),
          );
        };
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 78, 171, 253),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 3),
              blurRadius: 6,
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
