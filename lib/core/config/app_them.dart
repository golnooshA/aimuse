import 'package:flutter/material.dart';
import 'design_config.dart';

class AppTheme {
  /// Light theme using Material 3
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // Use a seed-based color scheme for cohesive Material3 styles
    colorScheme: ColorScheme.fromSeed(
      seedColor: DesignConfig.selectedColor,
      brightness: Brightness.light,
    ),

    // Scaffold background
    scaffoldBackgroundColor: Colors.white,

    // App bar styling
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),

    // Bottom navigation
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    ),

    // Date picker (Material3) styling
    datePickerTheme: DatePickerThemeData(
      // Header background & text
      headerBackgroundColor: DesignConfig.selectedColor,
      headerForegroundColor: Colors.white,
      // Day cell text & background
      dayForegroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) return Colors.white;
        if (states.contains(WidgetState.disabled)) return Colors.grey;
        return Colors.black;
      }),
      dayBackgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) return DesignConfig.selectedColor;
        return null;
      }),
      // Today indicator
      todayForegroundColor: WidgetStateProperty.all(DesignConfig.sliderActiveColor),
    ),

    // Elevated buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DesignConfig.buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
    ),

    // Choice chips
    // choiceChipTheme: ChoiceChipThemeData(
    //   selectedColor: DesignConfig.selectedColor,
    //   backgroundColor: Colors.grey.shade200,
    //   labelStyle: TextStyle(color: Colors.black),
    //   selectedLabelStyle: TextStyle(color: Colors.white),
    // ),
    //
    // // Filter chips
    // filterChipTheme: FilterChipThemeData(
    //   selectedColor: DesignConfig.selectedColor,
    //   backgroundColor: Colors.grey.shade200,
    //   labelStyle: TextStyle(color: Colors.black),
    //   selectedLabelStyle: TextStyle(color: Colors.white),
    //   showCheckmark: false,
    // ),

    // Sliders
    sliderTheme: SliderThemeData(
      thumbColor: DesignConfig.sliderActiveColor,
      activeTrackColor: DesignConfig.sliderActiveColor,
      inactiveTrackColor: Colors.grey.shade300,
    ),

    // Switches
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(DesignConfig.sliderActiveColor),
      trackColor: WidgetStateProperty.resolveWith((states) => DesignConfig.sliderActiveColor.withOpacity(0.5)),
    ),

    // Default text styles
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );
}