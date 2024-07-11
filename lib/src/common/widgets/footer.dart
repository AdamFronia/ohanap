import 'package:flutter/material.dart';
import 'package:ohanap/src/features/friendbook/presentation/friendbook_screen.dart';
import 'package:ohanap/src/features/home/presentation/home_screen.dart';
import 'package:ohanap/src/features/home/presentation/info_screens/about_me_page.dart';
import 'package:ohanap/src/features/home/presentation/info_screens/info_page.dart';

class Footer extends StatefulWidget {
  const Footer({
    super.key,
  });

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  late String selectedEmoji = '';
  late String location = '';
  bool isStarSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: const Color.fromARGB(255, 14, 227, 255),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildSmallButton(context, 'note'),
          buildSmallButton(context, 'features'),
          buildSmallButton(context, 'home'),
          buildSmallButton(context, 'users'),
          GestureDetector(
            onTap: () {
              setState(() {
                isStarSelected = !isStarSelected;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isStarSelected
                    ? const Color.fromARGB(255, 247, 255, 95)
                    : null,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 0),
                    blurRadius: 14,
                  ),
                ],
              ),
              child: Icon(
                Icons.star,
                color:
                    isStarSelected ? const Color.fromARGB(255, 0, 0, 0) : null,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSmallButton(BuildContext context, String icon) {
    IconData? buttonIcon;
    Function()? onPressed;

    switch (icon) {
      case 'note':
        buttonIcon = Icons.last_page;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InfoPage()),
          );
        };

        break;
      case 'features':
        buttonIcon = Icons.first_page;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutMePage()),
          );
        };

        break;
      case 'home':
        buttonIcon = Icons.home_outlined;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        };
        break;
      case 'users':
        buttonIcon = Icons.add_circle_outline;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FriendbookScreen()),
          );
        };
        break;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFA1EFFD),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 101, 202).withOpacity(0.35),
              offset: const Offset(4, 4),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Icon(
          buttonIcon,
          color: const Color.fromARGB(255, 0, 101, 202),
          size: 40,
        ),
      ),
    );
  }
}
