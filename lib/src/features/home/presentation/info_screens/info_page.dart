import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/data/auth_repository.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/components/todolist.dart';
import 'package:ohanap/src/features/home/presentation/about_me/about_me.dart';
import 'package:ohanap/src/features/home/presentation/about_me/favorites.dart';
import 'package:ohanap/src/features/home/presentation/about_me/funnys.dart';
import 'package:ohanap/src/features/home/presentation/about_me/futures.dart';
import 'package:ohanap/src/features/home/presentation/about_me/goodys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoPage extends StatefulWidget {
  final DatabaseRepository databaseRepository;
  final AuthRepository authRepository;

  const InfoPage(
      {super.key,
      required this.databaseRepository,
      required this.authRepository});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late String savedData = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedData = prefs.getString('savedData') ?? '';
    });
  }

  Future<void> _saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      authRepository: widget.authRepository,
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
                Favorites(
                  databaseRepository: widget.databaseRepository,
                ),
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
                AboutMe(databaseRepository: widget.databaseRepository),
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
