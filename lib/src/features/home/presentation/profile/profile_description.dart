import 'package:flutter/material.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:provider/provider.dart';

class ProfileDescription extends StatefulWidget {
  const ProfileDescription({
    super.key,
  });

  @override
  State<ProfileDescription> createState() => _ProfileDescriptionState();
}

class _ProfileDescriptionState extends State<ProfileDescription> {
  late TextEditingController descriptionController;

  @override
  void initState() {
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authRepository = context.read<AuthRepository>();
    final userUid = authRepository.getCurrentUser()?.uid;

    return StreamBuilder(
        stream: context
            .read<DatabaseRepository>()
            .getSpecificProfile(userUid!), // Verwendet userUid
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            descriptionController.text = snapshot.data?.readme ?? "";

            return TextFormField(
              controller: descriptionController,
              onEditingComplete: () async {
                try {
                  await context.read<DatabaseRepository>().updateDescription(
                      userUid, descriptionController.text); // Verwendet userUid
                } catch (e) {
                  print(e);
                }
                print("updated");
              },
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
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
