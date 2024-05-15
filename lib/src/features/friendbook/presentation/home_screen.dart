import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';

class HomeScreen extends StatefulWidget {
  final DatabaseRepository databaseRepository;
  const HomeScreen({super.key, required this.databaseRepository});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String selectedEmoji = '';
  late String location = '';
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      databaseRepository: widget.databaseRepository,
      content: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft + const Alignment(1.0, 3.2),
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
