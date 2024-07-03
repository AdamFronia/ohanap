import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/custom_icon_button.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';

class FriendbookScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
  // Konstruktor
  const FriendbookScreen(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      databaseRepository: databaseRepository,
      authRepository: authRepository,
      content: FutureBuilder<List<Profile>>(
        future: databaseRepository.getAllProfiles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Icon(Icons.error));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No profiles found'));
          } else {
            final allProfiles = snapshot.data!;
            return ListView.separated(
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
                      const Spacer(),
                      const CustomIconButton(icon: Icons.add),
                      const SizedBox(width: 10),
                      const CustomIconButton(icon: Icons.visibility),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
