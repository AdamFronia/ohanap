import 'package:flutter/material.dart';
import 'package:ohanap/src/common/widgets/footer.dart';
import 'package:ohanap/src/common/widgets/header.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';

class TemplateScreen extends StatefulWidget {
  final Widget content;
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;
  const TemplateScreen({
    super.key,
    required this.databaseRepository,
    required this.content,
    required this.authRepository,
  });

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  bool isStarSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Footer(
        databaseRepository: widget.databaseRepository,
        authRepository: widget.authRepository,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/hintergrund1.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      databaseRepository: widget.databaseRepository,
                      authRepository: widget.authRepository,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Divider(
                        color: Color.fromARGB(255, 0, 0, 0),
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    // ab hier individuell
                    widget.content,
                    // hier ended die invidua...
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Divider(
                        color: Color.fromARGB(255, 0, 0, 0),
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
