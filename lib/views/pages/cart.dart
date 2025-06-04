import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/core/colors.dart';
import 'package:mad_1_gamenova_1/core/game.dart';
import 'package:mad_1_gamenova_1/core/games_lists.dart';
import 'package:mad_1_gamenova_1/views/widgets/button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0;

  void remove(Game game) {
    setState(() {
      cartGames.remove(game);
    });
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
                  "Rs.${game.price * amount}",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            MyButton("Remove", () => remove(game), Colors.white),
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
                  "Rs.${game.price * amount}",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                MyButton("Remove", () => remove(game), Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTotalPrice() {
    return Text(
      "Total Price: ${totalPrice.toString()}",
      style: TextStyle(fontSize: 30),
    );
  }

  @override
  Widget build(BuildContext context) {
    final entries = cartGames.entries.toList();
    totalPrice = 0;
    entries.forEach((entry) {
      totalPrice += (entry.key.price * entry.value);
    });
    if (entries.isEmpty) {
      return Center(child: Container(child: Text("No Cart Items")));
    } else {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
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
              ),
            ),
            buildTotalPrice(),
          ],
        ),
      );
    }
  }
}
