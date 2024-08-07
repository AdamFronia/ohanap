import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';
import 'package:provider/provider.dart';

class Todolist extends StatefulWidget {
  const Todolist({
    super.key,
  });

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  late final Future<List<Profile>> futureProfile;

  @override
  void initState() {
    futureProfile = context.read<DatabaseRepository>().getAllProfiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 330,
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 251, 255, 43),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(50),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(children: [
        Positioned(
          right: 0,
          left: 0,
          top: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            child: SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: FutureBuilder(
                  future: futureProfile,
                  builder: (context, snapshot) {
                    /*
                1. Uncompleted (Ladend)
                2. Completed with data (Fertig)
                3. Completed with error (Fehler)
                 */
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      // FALL: Future ist komplett und hat Daten!

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data![0].dataList.length,
                        itemBuilder: (context, index) {
                          final String? title =
                              snapshot.data![0].dataList[index]["title"];
                          List<Map<String, dynamic>> meineListe =
                              snapshot.data![0].dataList;
                          return CheckboxListTile(
                            key: ValueKey(meineListe[index]["isChecked"]),
                            value: meineListe[index]["isChecked"],
                            onChanged: (value) async {
                              setState(() {
                                meineListe[index]["isChecked"] = value!;
                              });

                              // Firestore Daten Updaten
                              await context
                                  .read<DatabaseRepository>()
                                  .updateToDoList(
                                      meineListe, snapshot.data!.first.docID);
                            },
                            title: title != null
                                ? Text(
                                    title,
                                    style:
                                        const TextStyle(color: Colors.black87),
                                  )
                                : null,
                          );
                        },
                      );
                    } else if (snapshot.connectionState !=
                        ConnectionState.done) {
                      // FALL: Sind noch im Ladezustand
                      return const Center(
                        child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator()),
                      );
                    } else {
                      // FALL: Es gab nen Fehler
                      return const Icon(Icons.error);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            child: Container(
              width: 150,
              height: 50,
              color: const Color.fromARGB(255, 251, 255, 43),
              child: Image.asset(
                'assets/checklist.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
