import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final DocumentSnapshot doc;
  const ChatPage({super.key, required this.doc});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

TextEditingController message = TextEditingController();

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'ChatPage', //////könnte man den Namen der person mit dem du chattes stehen
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color:
                  const Color.fromARGB(255, 13, 17, 232)), //////farben ändern
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.2),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    Expanded(
                      child: StreamBuilder(
                        stream: widget.doc.reference
                            .collection('messages')
                            .orderBy('time')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data?.docs.isEmpty ?? true) {
                              return Center(
                                child: Text(
                                  'No messages yet!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: const Color.fromARGB(
                                              255, 18, 204, 237)

                                          /// Farbe..?
                                          ),
                                ),
                              );
                            }
                            return ListView.builder(
                              padding: const EdgeInsets.all(8),
                              itemCount: snapshot.data?.docs.length ?? 0,
                              itemBuilder: (context, index) {
                                DocumentSnapshot msg =
                                    snapshot.data!.docs[index];
                                if (msg['uid'] ==
                                    FirebaseAuth.instance.currentUser!.uid) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color.fromARGB(
                                                    255, 193, 210, 254)

                                                ///FArbe..?
                                                ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    textAlign: TextAlign.right,
                                                    msg['message'].toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                            color: const Color
                                                                .fromARGB(
                                                                255, 0, 0, 0)

                                                            ///FArbe..?
                                                            ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color.fromARGB(
                                                    255, 164, 177, 252)

                                                ///FArbe..?
                                                ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    textAlign: TextAlign.left,
                                                    msg['message'].toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                            color: const Color
                                                                .fromARGB(
                                                                255, 2, 2, 2)

                                                            ///FArbe..?
                                                            ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ],
                                  );
                                }
                              },
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: message,
                              decoration: InputDecoration(
                                hintText: 'Write a message...',
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  child: SizedBox(
                                    height: 24,
                                    child: FloatingActionButton(
                                      onPressed: () async {
                                        await widget.doc.reference
                                            .collection('messages')
                                            .add(
                                          {
                                            'time': DateTime.now(),
                                            'uid': FirebaseAuth
                                                .instance.currentUser!.uid,
                                            'message': message.text
                                          },
                                        );
                                        await widget.doc.reference.update(
                                            {'recent_text': message.text});
                                        message.clear();
                                      },
                                      child: const Icon(
                                        Icons.send,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
