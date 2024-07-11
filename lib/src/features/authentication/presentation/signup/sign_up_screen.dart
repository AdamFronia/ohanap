import 'package:flutter/material.dart';
import 'package:ohanap/src/features/authentication/presentation/signup/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  // Konstruktor
  const SignUpScreen({
    super.key,
  });

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _termsAccepted = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSignUpData();
  }

  Future<void> _loadSignUpData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('signUpEmail') ?? '';
      _passwordController.text = prefs.getString('signUpPassword') ?? '';
      _confirmPasswordController.text =
          prefs.getString('confirmSignUpPassword') ?? '';
      _termsAccepted = prefs.getBool('termsAccepted') ?? false;
    });
  }

  Future<void> _saveSignUpData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('signUpEmail', _emailController.text);
    await prefs.setString('signUpPassword', _passwordController.text);
    await prefs.setString(
        'confirmSignUpPassword', _confirmPasswordController.text);
    await prefs.setBool('termsAccepted', _termsAccepted);
  }

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
    return const Scaffold(
      body: Stack(
        children: [
          Signup(),
        ],
      ),
    );
  }
}
