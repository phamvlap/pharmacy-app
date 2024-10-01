import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final Color greyColor = Colors.grey[700]!;
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static final Color primaryColor = Colors.green[700]!;
  static final Color secondaryColor = Colors.yellow[800]!;
  static const Color mainBackgroundColor = Color.fromARGB(255, 248, 248, 248);
}

class AppFontSizes {
  static const double bodyLarge = 14.0;
  static const double displaySmall = 16.0;
  static const double titleLarge = 20.0;
  static const double displayMedium = 21.0;
  static const double displayLarge = 32.0;
  static const double textExtraSmall = 12.0;
  static const double textSmall = 14.0;
  static const double textNormal = 16.0;
  static const double textMedium = 18.0;
  static const double textLarge = 22.0;
  static const double textExtraLarge = 26.0;
  static const double textExtraExtraLarge = 30.0;
}

class AppTheme {
  // light text theme
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.openSans(
      fontSize: AppFontSizes.bodyLarge,
      fontWeight: FontWeight.w700,
      color: AppColors.greyColor,
    ),
    displayLarge: GoogleFonts.openSans(
      fontSize: AppFontSizes.displayLarge,
      fontWeight: FontWeight.bold,
      color: AppColors.greyColor,
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: AppFontSizes.displayMedium,
      fontWeight: FontWeight.w700,
      color: AppColors.greyColor,
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: AppFontSizes.displaySmall,
      fontWeight: FontWeight.w600,
      color: AppColors.greyColor,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: AppFontSizes.titleLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.greyColor,
    ),
  );
  // dark text theme
  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.openSans(
      fontSize: AppFontSizes.bodyLarge,
      fontWeight: FontWeight.w700,
      color: AppColors.whiteColor,
    ),
    displayLarge: GoogleFonts.openSans(
      fontSize: AppFontSizes.bodyLarge,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
    displayMedium: GoogleFonts.openSans(
      fontSize: AppFontSizes.displayMedium,
      fontWeight: FontWeight.w700,
      color: AppColors.whiteColor,
    ),
    displaySmall: GoogleFonts.openSans(
      fontSize: AppFontSizes.displaySmall,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: AppFontSizes.titleLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
  );

  static ColorScheme lightColorTheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static ColorScheme darkColorTheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
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
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.primaryColor,
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 66.0,
        surfaceTintColor: Colors.white,
        indicatorColor: Colors.transparent,
        elevation: 8.0,
        shadowColor: Colors.grey.withOpacity(0.9),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(
                color: AppColors.primaryColor,
                fontSize: AppFontSizes.textSmall,
                fontWeight: FontWeight.w500,
              );
            }
            return TextStyle(
              color: AppColors.greyColor,
              fontSize: AppFontSizes.textSmall,
              fontWeight: FontWeight.w500,
            );
          },
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(
                color: AppColors.primaryColor,
                size: AppFontSizes.textLarge,
              );
            }
            return IconThemeData(
              color: AppColors.greyColor,
              size: AppFontSizes.textLarge,
            );
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
        foregroundColor: AppColors.whiteColor,
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.secondaryColor,
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
