import 'package:flutter/material.dart';
import 'package:ohanap/src/common/widgets/footer.dart';
import 'package:ohanap/src/common/widgets/header.dart';
import 'package:ohanap/src/data/database_repository.dart';

class TemplateScreen extends StatefulWidget {
  final Widget content;
  final DatabaseRepository databaseRepository;
  const TemplateScreen({
    super.key,
    required this.databaseRepository,
    required this.content,
  });

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  bool isStarSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Divider(
                        color: Color.fromARGB(255, 0, 0, 0),
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                      height: 4,
                    ),
                    Footer(databaseRepository: widget.databaseRepository),
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
