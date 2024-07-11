import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';

class ProfileRelationshipStatus extends StatefulWidget {
  const ProfileRelationshipStatus({
    super.key,
    required this.databaseRepository,
  });
  final DatabaseRepository databaseRepository;

  @override
  State<ProfileRelationshipStatus> createState() =>
      _ProfileRelationshipStatusState();
}

class _ProfileRelationshipStatusState extends State<ProfileRelationshipStatus> {
  late TextEditingController relationshipStatus;

  @override
  void initState() {
    // ToDo Hier den Text setzen
    relationshipStatus = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    relationshipStatus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.databaseRepository
            .getSpecificProfile("l75mGuGI0dKtUKMWQ6m5"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            relationshipStatus.text = snapshot.data?.relationShip ?? "";
            return Container(
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
                      color: Color.fromARGB(255, 28, 39, 166),
                    ),
                  ),
                  const SizedBox(height: 2),
                  TextFormField(
                    controller: relationshipStatus,
                    onEditingComplete: () async {
                      // TODO: Id Dynamisch hinzufügen
                      try {
                        await widget.databaseRepository
                            .updateRelationshipStatus("l75mGuGI0dKtUKMWQ6m5",
                                relationshipStatus.text);
                      } catch (e) {
                        print(e);
                      }

                      print("updated");
                    },
                    decoration: InputDecoration(
                      labelText: 'Gib deinen Beziehungsstatus ein',
                      labelStyle: const TextStyle(color: Colors.blueGrey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
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
                  ),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

/// 1. TExtFeld finden
/// 2. TExtEdetingController erstellen
/// 3. TextedetingController zuweisen
/// 4. Beim Textfeld leer Methode 'onEdetingCompleted' erstellen
/// 5. Methode aus 'databaseRepository' aufrufen 
/// 6. Text aus TextEdetingController übergeben
