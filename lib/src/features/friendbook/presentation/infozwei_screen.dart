import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/home_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/infoeins_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/user_screen.dart';

class InfozweiScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const InfozweiScreen({super.key, required this.databaseRepository});
  @override
  State<InfozweiScreen> createState() => _InfozweiScreenState();
}

class _InfozweiScreenState extends State<InfozweiScreen> {
  List<Map<String, dynamic>> dataList = [];
  List<String> itemTitles = [
    "Ich habe Geschwister",
    "Ich mache gerne Sport",
    "Ich lese gerne",
    "Ich mag Tiere",
    "Ich bin immer pünktlich",
    "Ich esse gerne Obst",
    "Ich bin Hilfsbereit",
    "Ich schlafe gerne",
    "Ich Kuschel gerne",
    "Ich treffe mich gerne mit einen Freunden",
  ];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < itemTitles.length; i++) {
      dataList.add({
        "titleIndex": i,
        "isChecked": false,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      databaseRepository: widget.databaseRepository,
      content: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 220,
                  height: 330,
                  decoration: ShapeDecoration(
                    color: const Color.fromARGB(255, 247, 188, 38),
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
                        right: 0,
                        left: 0,
                        top: 0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                          child: SizedBox(
                            height: 300,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: dataList.length,
                              itemBuilder: (context, index) {
                                final int? titleIndex =
                                    dataList[index]["titleIndex"];
                                final String? title = titleIndex != null
                                    ? itemTitles[titleIndex]
                                    : null;
                                return CheckboxListTile(
                                  value: dataList[index]["isChecked"],
                                  onChanged: (value) {
                                    setState(() {
                                      dataList[index]["isChecked"] = value!;
                                    });
                                  },
                                  title: title != null
                                      ? Text(
                                          title,
                                          style: const TextStyle(
                                              color: Colors.black87),
                                        )
                                      : null,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: 0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                          child: Container(
                            width: 150,
                            height: 50,
                            color: const Color.fromARGB(255, 247, 188, 38),
                            child: Image.asset(
                              'assets/checklist.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  width: 220,
                  height: 330,
                  decoration: ShapeDecoration(
                    color: const Color.fromARGB(255, 47, 181, 23),
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
                        right: 80,
                        top: 10,
                        child: Image.asset(
                          'assets/love.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        bottom: 220,
                        child: SizedBox(
                          width: 140,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Essen',
                              labelStyle: TextStyle(
                                color: Colors.black,
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
                      const Positioned(
                        left: 20,
                        bottom: 160,
                        child: SizedBox(
                          width: 140,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Getränk',
                              labelStyle: TextStyle(
                                color: Colors.black,
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
                      const Positioned(
                        left: 20,
                        bottom: 100,
                        child: SizedBox(
                          width: 140,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Musik',
                              labelStyle: TextStyle(
                                color: Colors.black,
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
                      const Positioned(
                        left: 20,
                        bottom: 40,
                        child: SizedBox(
                          width: 140,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Tier',
                              labelStyle: TextStyle(
                                color: Colors.black,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 250,
                  height: 233,
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
                        right: 100,
                        top: 40,
                        child: Image.asset(
                          'assets/personality.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        bottom: 25,
                        child: SizedBox(
                          width: 210,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Über mich',
                              labelStyle: TextStyle(
                                color: Colors.black,
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
                const SizedBox(width: 5),
                Container(
                  width: 250,
                  height: 233,
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
                        right: 100,
                        top: 40,
                        child: Image.asset(
                          'assets/endorsement.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        bottom: 25,
                        child: SizedBox(
                          width: 210,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Das kann ich besonders gut',
                              labelStyle: TextStyle(
                                color: Colors.black,
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
                const SizedBox(width: 5),
                Container(
                  width: 250,
                  height: 233,
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
                        right: 100,
                        top: 40,
                        child: Image.asset(
                          'assets/lol.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        bottom: 25,
                        child: SizedBox(
                          width: 210,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'etwas lustiges über mich',
                              labelStyle: TextStyle(
                                color: Colors.black,
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
                const SizedBox(width: 5),
                Container(
                  width: 300,
                  height: 233,
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
                        right: 125,
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
                          width: 260,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Wo siehst du dich in der Zukunft',
                              labelStyle: TextStyle(
                                color: Colors.black,
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
              ],
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

        break;
      case 'features':
        buttonIcon = Icons.first_page;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InfoeinsScreen(
                      databaseRepository: widget.databaseRepository,
                    )), // Navigiere zum InfozweiScreen
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
                      databaseRepository: widget.databaseRepository,
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
                      databaseRepository: widget.databaseRepository,
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
