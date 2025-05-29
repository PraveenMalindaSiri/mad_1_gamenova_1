import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/views/pages/home.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("GameNova", style: TextStyle(fontSize: 32))),
      ),
      body: HomeScreen(),
    );
  }
}
