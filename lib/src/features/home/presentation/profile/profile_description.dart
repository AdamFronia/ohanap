import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';

class ProfileDescription extends StatelessWidget {
  const ProfileDescription(
      {super.key, required DatabaseRepository databaseRepository});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      style: const TextStyle(color: Colors.black),
    );
  }
}
