import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/data/mock_database_repository.dart';
import 'package:ohanap/src/features/friendbook/presentation/infoeins_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/infozwei_screen.dart';
import 'package:ohanap/src/features/friendbook/presentation/user_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Database einmal an der Wurzel erzeugt
    DatabaseRepository databaseRepository = MockDatabaseRepository();

    return MaterialApp(
      home: UserScreen(databaseRepository: databaseRepository),
      // SplashScreen(databaseRepository: databaseRepository),
      theme: FlexThemeData.light(scheme: FlexScheme.aquaBlue).copyWith(
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.akayaKanadaka(),
        ),
      ),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      themeMode: ThemeMode.system,
    );
  }
}
