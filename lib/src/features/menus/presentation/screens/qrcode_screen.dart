import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/common/widgets/ohana_button.dart';
import 'package:ohanap/src/features/menus/presentation/menu_screen.dart';

class QrcodeScreen extends StatelessWidget {
  // Attribute

  // Konstruktor
  const QrcodeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
        content: Column(
      children: [
        OhanaButton(
          text: "QR-Code",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MenuScreen()));
          },
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Divider(
            color: Color.fromARGB(255, 0, 0, 0),
            thickness: 1,
          ),
        ),
        Image.asset(
          'assets/qr-code.png',
          width: 372,
          height: 372,
        ),
      ],
    ));
  }
}
