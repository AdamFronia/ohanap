import 'dart:async';
import 'dart:developer';
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
      StreamController();
  Stream<Map<String, String?>> get _stream => _streamController.stream;
  File? image;
  File? image2;
  ImageProvider? networkImage;
  ImageProvider? networkImage2;
  String? bigImage;
  String? smallImage;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNetworkImages();
    fetchData();
  }

  Future<void> _loadNetworkImages() async {
    if (widget.profile.mainProfileURL != null &&
        widget.profile.mainProfileURL!.isNotEmpty) {
      setState(() {
        networkImage = NetworkImage(widget.profile.mainProfileURL!);
      });
    }

    if (widget.profile.secondImageProfileURL != null &&
        widget.profile.secondImageProfileURL!.isNotEmpty) {
      setState(() {
        networkImage2 = NetworkImage(widget.profile.secondImageProfileURL!);
      });
    }
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

      await _uploadImageToFirebase(imageTemp, isMain);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> _uploadImageToFirebase(File imageFile, bool isMain) async {
    try {
      final fileName = isMain ? 'mainProfilePic.jpg' : 'secondProfilePic.jpg';
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profilePictures/${widget.profile.docID}/$fileName');
      await storageRef.putFile(imageFile);

      final downloadURL = await storageRef.getDownloadURL();
      await _updateProfilePictureURL(downloadURL, isMain);
    } catch (e) {
      print('Failed to upload image: $e');
    }
  }

  Future<void> _updateProfilePictureURL(String downloadURL, bool isMain) async {
    try {
      final profileRef = FirebaseFirestore.instance
          .collection('profiles')
          .doc(widget.profile.docID);
      await profileRef.update({
        isMain ? 'profilePicUrlBig' : 'profilePicUrlSmall': downloadURL,
      });

      setState(() {
        if (isMain) {
          networkImage = NetworkImage(downloadURL);
        } else {
          networkImage2 = NetworkImage(downloadURL);
        }
      });
    } catch (e) {
      print('Failed to update Firestore: $e');
    }
  }

  Future<void> fetchData() async {
    try {
      final docID = widget.profile.docID;
      final doc = await FirebaseFirestore.instance
          .collection('profiles')
          .doc(docID)
          .get();
      final data = doc.data();

      if (data != null) {
        _streamController.add({
          'bigImage': data['profilePicUrlBig'] ?? "",
          'smallImage': data['profilePicUrlSmall'] ?? ""
        });
      } else {
        _streamController.add({'bigImage': "", 'smallImage': ""});
      }
    } catch (e) {
      log('Error fetching user data: $e');
      _streamController.add({'bigImage': "", 'smallImage': ""});
    }
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Map<String, String?>>(
      stream: _stream,
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
                          child: Image.network(
                            bigImage,
                            fit: BoxFit.scaleDown,
                            width: 150,
                            height: 150,
                          ),
                        )
                      : Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            image: networkImage != null
                                ? DecorationImage(
                                    image: networkImage!,
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: networkImage == null
                              ? const Icon(
                                  Icons.person_add_outlined,
                                  size: 55,
                                  color: Colors.white,
                                )
                              : null,
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
                          child: Image.network(
                            smallImage,
                            fit: BoxFit.scaleDown,
                            width: 75,
                            height: 75,
                          ),
                        )
                      : Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            image: networkImage2 != null
                                ? DecorationImage(
                                    image: networkImage2!,
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: networkImage2 == null
                              ? const Icon(
                                  Icons.person_add_outlined,
                                  size: 45,
                                  color: Colors.white,
                                )
                              : null,
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
