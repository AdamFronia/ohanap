import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';
import 'package:ohanap/src/features/home/presentation/profile/profile_description.dart';
import 'package:ohanap/src/features/home/presentation/profile/profile_location.dart';
import 'package:ohanap/src/features/home/presentation/profile/profile_picture.dart';
import 'package:ohanap/src/features/home/presentation/profile/profile_realtionship_status.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String selectedEmoji = '';
  late String location = '';
  final StreamController<List<Profile>> _profileStreamController =
      StreamController();

  @override
  void initState() {
    super.initState();
    _loadSelectedEmoji();
    _loadProfiles();
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

  Future<void> _loadProfiles() async {
    try {
      final profiles =
          await context.read<DatabaseRepository>().getAllProfiles();
      _profileStreamController.add(profiles);
    } catch (e) {
      log('Error loading profiles: $e');
      _profileStreamController.addError(e);
    }
  }

  @override
  void dispose() {
    _profileStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      content: StreamBuilder<List<Profile>>(
        stream: _profileStreamController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            log('Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final profiles = snapshot.data!;
            final profile = profiles.isNotEmpty ? profiles.first : null;

            if (profile == null) {
              return const Center(child: Text("Profile not available"));
            }

            return Column(
              children: [
                ProfilePicture(
                  profile: profile,
                ),
                const SizedBox(height: 5),
                const ProfileDescription(),
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
                const ProfileRelationshipStatus(),
                const SizedBox(height: 10),
                const ProfileLocation(),
                const SizedBox(height: 7),
              ],
            );
          } else {
            return const Center(child: Text("No data available"));
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
