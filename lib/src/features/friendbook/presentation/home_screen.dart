import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/homecenter.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/homecenterreadme.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/homeplace.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/homestatus.dart';

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
          Homecenter(databaseRepository: widget.databaseRepository),
          const SizedBox(height: 5),
          Homecenterreadme(databaseRepository: widget.databaseRepository),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
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
          ),
          const SizedBox(height: 5),
          Homestatus(databaseRepository: widget.databaseRepository),
          const SizedBox(height: 10),
          Homeplace(databaseRepository: widget.databaseRepository),
          const SizedBox(height: 7),
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
