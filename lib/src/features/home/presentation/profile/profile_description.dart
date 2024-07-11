import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';

class ProfileDescription extends StatefulWidget {
  const ProfileDescription({super.key, required this.databaseRepository});

  final DatabaseRepository databaseRepository;

  @override
  State<ProfileDescription> createState() => _ProfileDescriptionState();
}

class _ProfileDescriptionState extends State<ProfileDescription> {
  late TextEditingController discriptioncontroller;

  @override
  void initState() {
    discriptioncontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    discriptioncontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.databaseRepository
            .getSpecificProfile("l75mGuGI0dKtUKMWQ6m5"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            discriptioncontroller.text = snapshot.data?.readme ?? "";

            return TextFormField(
              controller: discriptioncontroller,
              onEditingComplete: () async {
                // TODO: Id Dynamisch hinzufügen
                try {
                  await widget.databaseRepository.updateDiscription(
                      "l75mGuGI0dKtUKMWQ6m5", discriptioncontroller.text);
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
