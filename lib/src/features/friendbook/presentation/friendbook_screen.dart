import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/custom_icon_button.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/features/menus/presentation/menu_screen.dart';

class FriendbookScreen extends StatelessWidget {
  final FirebaseAuth _firebaseAuth;

  FriendbookScreen({
    super.key,
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  late String userUid;

  String get getUserUid => userUid;

  /// Returns the currently logged in [User]
  /// or `null` if no user is logged in
  User? getCurrentUser() {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      userUid = currentUser.uid;
    }
    return currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      content: SingleChildScrollView(
        child: Column(
          children: [
            OhanaButton(
              text: "Suche",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuScreen()),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Suche',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FutureBuilder<QuerySnapshot>(
                  future:
                      FirebaseFirestore.instance.collection('profiles').get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Center(
                          child: Text('Error loading profiles'));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No profiles found'));
                    }

                    final profiles = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: profiles.length,
                      itemBuilder: (context, index) {
                        final profileData =
                            profiles[index].data() as Map<String, dynamic>;

                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(profileData['profilePicUrlBig']),
                          ),
                          title: Text(profileData['aboutMe'] ?? 'No Name'),
                          trailing: SizedBox(
                            width: 110,
                            child: Row(
                              children: [
                                CustomIconButton(
                                  icon: Icons.add,
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 8),
                                CustomIconButton(
                                  icon: Icons.chat,
                                  onPressed: () async {
                                    User? currentUser = getCurrentUser();
                                    if (currentUser == null) {
                                      // Handle the case where the user is not logged in
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Please log in first')),
                                      );
                                      return;
                                    }

                                    final userUid = currentUser.uid;
                                    QuerySnapshot q = await FirebaseFirestore
                                        .instance
                                        .collection('chats')
                                        .where('profiles',
                                            arrayContains: userUid)
                                        .get();

                                    if (q.docs.isEmpty) {
                                      var chatData = {
                                        'profiles': [
                                          userUid,
                                          profileData['uid']
                                        ], // Assuming 'uid' is available in profile data
                                        'recent_text': '',
                                      };
                                      await FirebaseFirestore.instance
                                          .collection('chats')
                                          .add(chatData);
                                    } else {
                                      // Navigate to the existing chat
                                      log('Existing chat found');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
