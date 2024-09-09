import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final Color _greyColor = Colors.grey[700]!;
  static const Color _whiteColor = Colors.white;
  static final Color _primaryColor = Colors.green[700]!;
  static final Color _secondaryColor = Colors.yellow[800]!;

  // light text theme
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: _greyColor,
    ),
    displayLarge: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: _greyColor,
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: _greyColor,
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: _greyColor,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: _greyColor,
    ),
  );
  // dark text theme
  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: _whiteColor,
    ),
    displayLarge: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: _whiteColor,
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: _whiteColor,
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: _whiteColor,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: _whiteColor,
    ),
  );

  static ColorScheme lightColorTheme = ColorScheme(
    brightness: Brightness.light,
    primary: _primaryColor,
    onPrimary: Colors.white,
    secondary: _secondaryColor,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static ColorScheme darkColorTheme = ColorScheme(
    brightness: Brightness.dark,
    primary: _primaryColor,
    onPrimary: Colors.white,
    secondary: _secondaryColor,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  // light theme
  static ThemeData light() {
    return ThemeData(
      colorScheme: lightColorTheme,
      textTheme: lightTextTheme,
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: _whiteColor,
        backgroundColor: _primaryColor,
        centerTitle: true,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: _whiteColor,
        backgroundColor: _primaryColor,
      ),
      navigationBarTheme: NavigationBarThemeData(
        surfaceTintColor: Colors.white,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(color: _primaryColor);
            }
            return const TextStyle(color: Colors.black);
          },
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: Colors.green);
            }
            return const IconThemeData(color: Colors.black);
          },
        ),
      ),
    );
  }

  // dark theme
  static ThemeData dark() {
    return ThemeData(
      colorScheme: darkColorTheme,
      textTheme: darkTextTheme,
      appBarTheme: const AppBarTheme(
        foregroundColor: _whiteColor,
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: _whiteColor,
        backgroundColor: _secondaryColor,
      ),
      navigationBarTheme: NavigationBarThemeData(
        surfaceTintColor: Colors.black,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(color: Colors.green);
            }
            return const TextStyle(color: Colors.white);
          },
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: Colors.green);
            }
            return const IconThemeData(color: Colors.white);
          },
        ),
      ),
    );
  }
}
