import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ohanap/src/features/welcome/presentation/splash_screen.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Database einmal an der Wurzel erzeugt

    return MaterialApp(
      home: const SplashScreen(
          // hier wird der start screen ausgeführt

          ),
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
