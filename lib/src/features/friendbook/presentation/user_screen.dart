import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';
import 'package:ohanap/src/features/friendbook/presentation/home_screen.dart';
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
                  const Row(
                    children: [
                      Expanded(
                        child: CustomButton(),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomIconButton(icon: Icons.mail_outlined),
                      ),
                      Spacer(),
                      CustomIconButton(icon: Icons.close),
                    ],
                  ),
                  ListView.separated(
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
                            const CustomIconButton(
                                icon: Icons.add), // "+" Button
                            const SizedBox(width: 10),
                            const CustomIconButton(
                                icon: Icons.visibility), // "Auge" Button
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSmallButton('note', databaseRepository, context),
                        buildSmallButton(
                            'features', databaseRepository, context),
                        buildSmallButton('home', databaseRepository, context),
                        buildSmallButton('users', databaseRepository, context),
                        GestureDetector(
                          onTap: () {
                            // Implementieren Sie die Aktion für den Stern-Button
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.transparent, // Farbe anpassen
                              borderRadius: BorderRadius.circular(50),
                              // Schatten und andere Eigenschaften anpassen
                            ),
                            child: const Icon(
                              Icons.star,
                              color: Colors.black, // Farbe anpassen
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
}
