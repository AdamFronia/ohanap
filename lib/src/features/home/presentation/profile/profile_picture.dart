import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';

class ProfilePicture extends StatefulWidget {
  final Profile profile;

  const ProfilePicture({
    super.key,
    required this.profile,
  });

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  final StreamController<Map<String, String?>> _streamController =
      StreamController<Map<String, String?>>();
  File? image;
  File? image2;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNetworkImages();
  }

  void _loadNetworkImages() {
    final profileRef = FirebaseFirestore.instance
        .collection('profiles')
        .doc(widget.profile.docID);

    Stream.fromFuture(profileRef.get()).listen((doc) {
      final data = doc.data();
      if (data != null) {
        _streamController.add({
          'bigImage': data['profilePicUrlBig'] ?? "",
          'smallImage': data['profilePicUrlSmall'] ?? ""
        });
      } else {
        _streamController.add({'bigImage': "", 'smallImage': ""});
      }
    }, onError: (error) {
      _streamController.add({'bigImage': "", 'smallImage': ""});
    });
  }

  Future<void> pickImage(ImageSource source, bool isMain) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;
      final imageTemp = File(pickedImage.path);

      setState(() {
        if (isMain) {
          image = imageTemp;
        } else {
          image2 = imageTemp;
        }
      });

      _uploadImageToFirebase(imageTemp, isMain);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void _uploadImageToFirebase(File imageFile, bool isMain) {
    final fileName = isMain ? 'mainProfilePic.jpg' : 'secondProfilePic.jpg';
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('profilePictures/${widget.profile.docID}/$fileName');

    Stream.fromFuture(storageRef.putFile(imageFile)).listen((taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((downloadURL) {
        _updateProfilePictureURL(downloadURL, isMain);
      }).catchError((error) {
        print('Failed to get download URL: $error');
      });
    }, onError: (error) {
      print('Failed to upload image: $error');
    });
  }

  void _updateProfilePictureURL(String downloadURL, bool isMain) {
    final profileRef = FirebaseFirestore.instance
        .collection('profiles')
        .doc(widget.profile.docID);

    Stream.fromFuture(profileRef.update({
      isMain ? 'profilePicUrlBig' : 'profilePicUrlSmall': downloadURL,
    })).listen((_) {
      _loadNetworkImages(); // Fetch the latest data after updating
    }, onError: (error) {
      print('Failed to update Firestore: $error');
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, String?>>(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading profile'));
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          final bigImage = data['bigImage']!;
          final smallImage = data['smallImage']!;

          return Stack(
            children: [
              Align(
                alignment: Alignment.topLeft + const Alignment(1.0, 3.2),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => BottomSheet(
                        onClosing: () {},
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('Camera'),
                              onTap: () {
                                pickImage(ImageSource.camera, true);
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('Gallery'),
                              onTap: () {
                                pickImage(ImageSource.gallery, true);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: bigImage.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              bigImage,
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            ),
                          ))
                      : Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                              image: AssetImage('assets/default_image.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
              ),
              Positioned(
                right: 60,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => BottomSheet(
                        onClosing: () {},
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('Camera'),
                              onTap: () {
                                pickImage(ImageSource.camera, false);
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.photo_library),
                              title: const Text('Gallery'),
                              onTap: () {
                                pickImage(ImageSource.gallery, false);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: smallImage.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              smallImage,
                              fit: BoxFit.cover,
                              width: 75,
                              height: 75,
                            ),
                          ))
                      : Container(
                          width: 75,
                          height: 75,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                              image: AssetImage('assets/default_image.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
