import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:provider/provider.dart';

class PersonalContainer extends StatelessWidget {
  final String assetPath;
  final String text;
  final Color color;
  final String firestoreKey;
  final String value;

  const PersonalContainer(
      {super.key,
      required this.assetPath,
      required this.text,
      required this.color,
      required this.firestoreKey,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: ShapeDecoration(
        color: color,
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
      child: Stack(
        children: [
          Positioned(
            right: 65,
            top: 40,
            child: Image.asset(
              assetPath,
              width: 50,
              height: 50,
            ),
          ),
          Positioned(
            left: 20,
            bottom: 25,
            child: SizedBox(
              width: 140,
              child: TextField(
                onChanged: (text) async {
                  await context.read<DatabaseRepository>().updateAboutMe(
                        firestoreKey,
                        "l75mGuGI0dKtUKMWQ6m5",
                      );
                },
                decoration: InputDecoration(
                  labelText: text,
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: color),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
