import 'package:flutter/material.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/home_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/infoeins_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/infozwei_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/user_screen.dart';

class Footer extends StatefulWidget {
  final DatabaseRepository databaseRepository;
  const Footer({super.key, required this.databaseRepository});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  late String selectedEmoji = '';
  late String location = '';
  bool isStarSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    offset: const Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Icon(
                Icons.star,
                color: isStarSelected ? Colors.black : null,
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
            MaterialPageRoute(
                builder: (context) => InfozweiScreen(
                      databaseRepository: widget.databaseRepository,
                    )),
          );
        };

        break;
      case 'features':
        buttonIcon = Icons.first_page;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InfoeinsScreen(
                      databaseRepository: widget.databaseRepository,
                    )),
          );
        };

        break;
      case 'home':
        buttonIcon = Icons.home_outlined;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      databaseRepository: widget.databaseRepository,
                    )),
          );
        };
        break;
      case 'users':
        buttonIcon = Icons.add_circle_outline;
        onPressed = () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserScreen(
                      databaseRepository: widget.databaseRepository,
                    )),
          );
        };
        break;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 78, 171, 253),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(4, 0),
              blurRadius: 4,
              spreadRadius: 0,
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
