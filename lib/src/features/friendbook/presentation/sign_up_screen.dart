import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/signup.dart';

class SignUpScreen extends StatefulWidget {
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const SignUpScreen({super.key, required this.databaseRepository});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool _termsAccepted = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? _validateEmail(String? value) {
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    final regExp = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return 'Bitte E-mail eingeben';
    } else if (!regExp.hasMatch(value)) {
      return 'Bitte eine gültige E-mail Adresse eingeben';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bitte Passwort eingeben';
    } else if (value.length < 8) {
      return 'Passwort muss mindestens 8 Zeichen lang sein';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Passwort muss mindestens einen Großbuchstaben enthalten';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Passwort muss mindestens eine Zahl enthalten';
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Passwort muss mindestens ein Sonderzeichen enthalten';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bitte Passwort wiederholen';
    } else if (value != _passwordController.text) {
      return 'Passwörter stimmen nicht überein';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Signup(
            databaseRepository: widget.databaseRepository,
          ),
        ],
      ),
    );
  }
}
