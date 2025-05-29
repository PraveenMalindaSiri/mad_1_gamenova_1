import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildIntro() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Container(
          child: Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/main/main_img2.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Welcome to GameNova",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Center(
                  child: Text(
                    'Level up your game collection now. Buy physical or digital edition of your next game. No region locks. No other barriers. Just pure gaming vibe. Gear up and game on!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhysicalSection() {
    return Container();
  }

  Widget _buildDigitalSection() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(children: [_buildIntro()]));
  }
}
