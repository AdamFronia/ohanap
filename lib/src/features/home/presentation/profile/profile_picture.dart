import 'dart:io';

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
  File? image;
  File? image2;
  ImageProvider? networkImage;
  ImageProvider? networkImage2;

  @override
  void initState() {
    super.initState();
    _loadNetworkImages();
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

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImage2(ImageSource source) async {
    try {
      final image2 = await ImagePicker().pickImage(source: source);
      if (image2 == null) return;
      final image2Temp = File(image2.path);
      setState(() => this.image2 = image2Temp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          pickImage(ImageSource.camera);
                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.photo_library),
                        title: const Text('Gallery'),
                        onTap: () {
                          pickImage(ImageSource.gallery);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            child: image != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Image.file(
                      fit: BoxFit.scaleDown,
                      image!,
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
                          pickImage2(ImageSource.camera);
                          Navigator.of(context).pop();
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.photo_library),
                        title: const Text('Gallery'),
                        onTap: () {
                          pickImage2(ImageSource.gallery);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            child: image2 != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Image.file(
                      fit: BoxFit.scaleDown,
                      image2!,
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
  }
}
