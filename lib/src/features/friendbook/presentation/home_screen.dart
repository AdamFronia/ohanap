import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/infoeins_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/infozwei_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/message_screen.dart'; // Import des MessageScreens hinzugefügt
import 'package:ohanap/src/features/friendbook/presentation/user_screen.dart';

class HomeScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const HomeScreen({super.key, required this.databaseRepository});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
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
                  ),
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
                                  databaseRepository: widget.databaseRepository,
                                ),
                              ),
                            );
                          },
                          child:
                              const CustomIconButton(icon: Icons.mail_outlined),
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
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment:
                            Alignment.topLeft + const Alignment(1.0, 3.2),
                        child: Image.asset(
                          'assets/ostseebroetchen.png',
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Positioned(
                        right: 80,
                        bottom: 0,
                        child: Image.asset(
                          'assets/papashund.png',
                          width: 75,
                          height: 75,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Lies mich',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (1).png',
                          selected: selectedEmoji == 'assets/superhero (1).png',
                        ),
                        const SizedBox(width: 10),
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (2).png',
                          selected: selectedEmoji == 'assets/superhero (2).png',
                        ),
                        const SizedBox(width: 10),
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (3).png',
                          selected: selectedEmoji == 'assets/superhero (3).png',
                        ),
                        const SizedBox(width: 10),
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (4).png',
                          selected: selectedEmoji == 'assets/superhero (4).png',
                        ),
                        const SizedBox(width: 10),
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (5).png',
                          selected: selectedEmoji == 'assets/superhero (5).png',
                        ),
                        const SizedBox(width: 10),
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero.png',
                          selected: selectedEmoji == 'assets/superhero.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                  ),
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
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Divider(
                      color: Color.fromARGB(255, 0, 0, 0),
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSmallButton(
                            'note', widget.databaseRepository, context),
                        buildSmallButton(
                            'features', widget.databaseRepository, context),
                        buildSmallButton(
                            'home', widget.databaseRepository, context),
                        buildSmallButton(
                            'users', widget.databaseRepository, context),
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
                                  ? const Color.fromARGB(255, 247, 255, 95)
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
}

Widget buildSmallButton(
    String icon, DatabaseRepository databaseRepository, BuildContext context) {
  Widget? buttonIcon;
  Function()? onTap;

  switch (icon) {
    case 'note':
      buttonIcon = const Icon(
        Icons.last_page,
        size: 40,
        color: Color.fromARGB(255, 0, 101, 202),
      );
      onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InfozweiScreen(
                    databaseRepository: databaseRepository,
                  )),
        );
      };
      break;
    case 'features':
      buttonIcon = const Icon(
        Icons.first_page,
        size: 40,
        color: Color.fromARGB(255, 0, 101, 202),
      );
      onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InfoeinsScreen(
                    databaseRepository: databaseRepository,
                  )),
        );
      };
      break;
    case 'home':
      buttonIcon = const Icon(
        Icons.home_outlined,
        size: 40,
        color: Color.fromARGB(255, 0, 101, 202),
      );
      break;
    case 'users':
      buttonIcon = const Icon(
        Icons.add_circle_outline,
        size: 40,
        color: Color.fromARGB(255, 0, 101, 202),
      );
      onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserScreen(
                    databaseRepository: databaseRepository,
                  )),
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
      child: Container(
        child: buttonIcon,
      ),
    ),
  );
}
