import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/menue_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/ohanabutton.dart';

class MenueimpressumScreen extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  const MenueimpressumScreen({
    super.key,
    required this.databaseRepository,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
        databaseRepository: databaseRepository,
        content: Column(
          children: [
            Ohanabutton(
                databaseRepository: databaseRepository,
                text: "Impressum",
                destination:
                    MenueScreen(databaseRepository: databaseRepository)),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Divider(
                color: Color.fromARGB(255, 0, 0, 0),
                thickness: 1,
              ),
            ),
            Ohanabutton(
                databaseRepository: databaseRepository,
                text: "Impressum",
                destination:
                    MenueScreen(databaseRepository: databaseRepository)),
          ],
        ));
  }
}
