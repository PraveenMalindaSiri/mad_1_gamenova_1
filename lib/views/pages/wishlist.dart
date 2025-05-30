import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/core/colors.dart';
import 'package:mad_1_gamenova_1/core/game.dart';
import 'package:mad_1_gamenova_1/core/games_lists.dart';
import 'package:mad_1_gamenova_1/views/widgets/button.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  void remove(Game game) {
    setState(() {
      wishlistGames.remove(game);
    });
  }

  void addToCart(int amount, Game game) {
    // cheking if the key is in the list before adding
    if (cartGames.containsKey(game)) {
      // if exists update the amount
      cartGames[game] = cartGames[game]! + amount;
    } else {
      // else add the new item
      cartGames[game] = amount;
    }
  }

  Widget buildPortraitItem(Game game, int amount) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: AppColors.darkGray),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  game.image,
                  fit: BoxFit.fill,
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Text(
              game.name,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  amount.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  "Rs.${game.price}",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton("Remove", () => remove(game), Colors.white),
                MyButton(
                  "Add to Cart",
                  () => addToCart(amount, game),
                  Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLandscapeItem(Game game, int amount) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: AppColors.darkGray),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  game.image,
                  fit: BoxFit.fill,
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  game.name,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  amount.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  "Rs.${game.price}",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                MyButton("Remove", () => remove(game), Colors.white),
                MyButton(
                  "Add to Cart",
                  () => addToCart(amount, game),
                  Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final entries = wishlistGames.entries.toList();
    if (entries.isEmpty) {
      return Center(
        child: Container(
          decoration: BoxDecoration(color: AppColors.darkSkyBlue),
          child: Text("No Wishlist Items"),
        ),
      );
    } else {
      return LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              if (constraints.maxWidth > 800) {
                return buildLandscapeItem(
                  entries[index].key,
                  entries[index].value,
                );
              } else {
                return buildPortraitItem(
                  entries[index].key,
                  entries[index].value,
                );
              }
            },
          );
        },
      );
    }
  }
}
