import 'package:flutter/material.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:provider/provider.dart';

class ProfileLocation extends StatefulWidget {
  const ProfileLocation({
    super.key,
  });

  @override
  State<ProfileLocation> createState() => _ProfileLocationState();
}

class _ProfileLocationState extends State<ProfileLocation> {
  late TextEditingController profileLocationcontroller;

  @override
  void initState() {
    profileLocationcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    profileLocationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authRepository = context.read<AuthRepository>();
    final userUid = authRepository.getCurrentUser()?.uid;
    return StreamBuilder(
        stream: context.read<DatabaseRepository>().getSpecificProfile(userUid!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            profileLocationcontroller.text = snapshot.data?.city ?? "";
            return Container(
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
                      color: Color.fromARGB(255, 15, 30, 200),
                    ),
                  ),
                  const SizedBox(height: 2),
                  TextFormField(
                    controller: profileLocationcontroller,
                    onEditingComplete: () async {
                      try {
                        await context.read<DatabaseRepository>().updateCity(
                            userUid, profileLocationcontroller.text);
                      } catch (e) {
                        print(e);
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Gib deine Adresse ein',
                      labelStyle: const TextStyle(color: Colors.lightBlue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
