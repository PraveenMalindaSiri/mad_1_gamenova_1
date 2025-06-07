import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/core/colors.dart';
import 'package:mad_1_gamenova_1/views/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.darkSkyBlue,
          primary: AppColors.darkSkyBlue,
          secondary: AppColors.darkGray,
          brightness: Brightness.dark,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: AppColors.skyBlue,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 20),
          bodySmall: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.skyBlue,
          primary: AppColors.skyBlue,
          secondary: AppColors.darkGray2,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.skyBlue,
          foregroundColor: Colors.black,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black, fontSize: 20),
          bodySmall: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
