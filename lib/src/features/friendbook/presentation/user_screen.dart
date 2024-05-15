import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';
import 'package:ohanap/src/features/friendbook/presentation/infozwei_screen.dart';

class UserScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const UserScreen({super.key, required this.databaseRepository});

  // Methoden
  @override
  Widget build(BuildContext context) {
    final List<Profile> allProfiles = databaseRepository.getAllProfiles();

    return TemplateScreen(
      databaseRepository: databaseRepository,
      content: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        shrinkWrap: true,
        itemCount: allProfiles.length,
        itemBuilder: (context, index) {
          final currentProfile = allProfiles[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.network(
                    currentProfile.profilePicUrl,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  currentProfile.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(), // Fügt Raum zwischen "User" und den neuen Buttons hinzu
                const CustomIconButton(icon: Icons.add), // "+" Button
                const SizedBox(width: 10),
                const CustomIconButton(icon: Icons.visibility), // "Auge" Button
              ],
            ),
          );
        },
      ),
    );
  }
}
