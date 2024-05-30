import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/aboutme.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/favos.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/funnys.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/futures.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/goodys.dart';
import 'package:ohanap/src/features/friendbook/presentation/widgets/todolist.dart';

class InfozweiScreen extends StatefulWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const InfozweiScreen({super.key, required this.databaseRepository});
  @override
  State<InfozweiScreen> createState() => _InfozweiScreenState();
}

class _InfozweiScreenState extends State<InfozweiScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      databaseRepository: widget.databaseRepository,
      content: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Todolist(
                  databaseRepository: widget.databaseRepository,
                ),
                const SizedBox(width: 5),
                Favos(
                  databaseRepository: widget.databaseRepository,
                )
              ],
            ),
          ),
          const SizedBox(height: 2),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(
              color: Color.fromARGB(255, 0, 0, 0),
              thickness: 1,
            ),
          ),
          const SizedBox(height: 2),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Aboutme(databaseRepository: widget.databaseRepository),
                const SizedBox(width: 5),
                Goodys(databaseRepository: widget.databaseRepository),
                const SizedBox(width: 5),
                Funnys(databaseRepository: widget.databaseRepository),
                const SizedBox(width: 5),
                Futures(databaseRepository: widget.databaseRepository),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
