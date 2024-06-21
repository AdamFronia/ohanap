import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/homecenter.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/homecenterreadme.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/homeplace.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/homestatus.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState() {
    super.initState();
    _loadSelectedEmoji();
  }

  Future<void> _loadSelectedEmoji() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedEmoji = prefs.getString('selectedEmoji') ?? '';
    });
  }

  Future<void> _saveSelectedEmoji(String emoji) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedEmoji', emoji);
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      databaseRepository: widget.databaseRepository,
      content: FutureBuilder(
        future: widget.databaseRepository.getAllProfiles(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            // FALL: Future ist komplett und hat Daten!
            return Column(
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
                        const SizedBox(width: 8),
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (2).png',
                          selected: selectedEmoji == 'assets/superhero (2).png',
                        ),
                        const SizedBox(width: 8),
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (3).png',
                          selected: selectedEmoji == 'assets/superhero (3).png',
                        ),
                        const SizedBox(width: 8),
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (4).png',
                          selected: selectedEmoji == 'assets/superhero (4).png',
                        ),
                        const SizedBox(width: 8),
                        _buildEmojiContainer(
                          assetPath: 'assets/superhero (5).png',
                          selected: selectedEmoji == 'assets/superhero (5).png',
                        ),
                        const SizedBox(width: 8),
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
            );
          } else if (snapshot.connectionState != ConnectionState.done) {
            // FALL: Sind noch im Ladezustand
            return const CircularProgressIndicator();
          } else {
            // FALL: Es gab nen Fehler
            return const Icon(Icons.error);
          }
        },
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
          _saveSelectedEmoji(selectedEmoji);
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
