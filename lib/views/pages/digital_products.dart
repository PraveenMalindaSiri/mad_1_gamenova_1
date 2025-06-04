import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/core/colors.dart';
import 'package:mad_1_gamenova_1/core/game.dart';
import 'package:mad_1_gamenova_1/core/games_lists.dart';
import 'package:mad_1_gamenova_1/views/pages/product_view.dart';
import 'package:mad_1_gamenova_1/views/widgets/card.dart';

class DigitalScreen extends StatefulWidget {
  const DigitalScreen({super.key});

  @override
  State<DigitalScreen> createState() => _DigitalScreenState();
}

class _DigitalScreenState extends State<DigitalScreen> {
  List<Game> rpgGames = [];
  List<Game> shooterGames = [];
  List<Game> carGames = [];

  @override
  void initState() {
    super.initState();
    for (var game in dGames) {
      if (game.genre.toLowerCase() == "rpg") {
        rpgGames.add(game);
      } else if (game.genre.toLowerCase() == "shooter") {
        shooterGames.add(game);
      } else {
        carGames.add(game);
      }
    }
  }

  Widget _buildGenreSection(String title, List<Game> games) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(color: AppColors.darkGray),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: games.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: GameCard(game: games[index]),
                    onTap: () {
                      Navigator.push(
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
            Padding(padding: EdgeInsets.only(bottom: 10)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (rpgGames.isNotEmpty) _buildGenreSection("RPG Games", rpgGames),
            if (shooterGames.isNotEmpty)
              _buildGenreSection("Shooter Games", shooterGames),
            if (carGames.isNotEmpty) _buildGenreSection("Car Games", carGames),
          ],
        ),
      ),
    );
  }
}
