import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final DatabaseRepository databaseRepository;
  bool _autoLogin = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadLoginData();
  }

  Future<void> _loadLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _autoLogin = prefs.getBool('autoLogin') ?? false;
    });
  }

  Future<void> _saveLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setBool('autoLogin', _autoLogin);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/Bildschirmfoto.png',
              ),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0EECFA),
                Color(0x821697D7),
              ],
            ),
          ),
          child: const LoginForm()),
    );
  }
}
