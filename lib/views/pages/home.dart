import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/core/colors.dart';
import 'package:mad_1_gamenova_1/core/game.dart';
import 'package:mad_1_gamenova_1/core/games_lists.dart';
import 'package:mad_1_gamenova_1/views/pages/digital_products.dart';
import 'package:mad_1_gamenova_1/views/pages/physical_products.dart';
import 'package:mad_1_gamenova_1/views/pages/product_view.dart';
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

  Widget _buildEditionSection(String edition, List<Game> games, Widget screen) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkGray,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    edition,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => screen),
                      );
                    },
                    child: Text(
                      "See more...",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
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
                    child: GameCard(game: games[index]),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  ProductViewScreen(game: games[index]),
                        ),
                      );
                    },
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
          _buildEditionSection('Physical Editions', pGames, PhysicalScreen()),
          _buildEditionSection("Digital Editions", dGames, DigitalScreen()),
        ],
      ),
    );
  }
}
