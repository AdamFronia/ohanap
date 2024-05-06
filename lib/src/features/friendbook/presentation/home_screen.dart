import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String selectedEmoji = '';

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
                    height: 20,
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
                    height: 20,
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
                    height: 8,
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
                    height: 8,
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
