import 'package:flutter/material.dart';
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
      theme: ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.blue, foregroundColor: Colors.white)),
      home: LoginScreen(),
    );
  }
}
