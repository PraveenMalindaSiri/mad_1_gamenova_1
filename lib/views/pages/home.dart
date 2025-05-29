import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/core/d_games_list%20.dart';
import 'package:mad_1_gamenova_1/core/p_games_list.dart';
import 'package:mad_1_gamenova_1/views/widgets/card.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.blueAccent),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Physical Editions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text("See more...")),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: GameCard(game: pGames[index]),
                    onTap: () {},
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        ),
      ),
    );
  }

  Widget _buildDigitalSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.blueAccent),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Digital Editions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text("See more...")),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: GameCard(game: dGames[index]),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildIntro(),
          _buildPhysicalSection(),
          _buildDigitalSection(),
        ],
      ),
    );
  }
}
