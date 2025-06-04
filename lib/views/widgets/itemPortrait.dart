import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/core/colors.dart';
import 'package:mad_1_gamenova_1/core/game.dart';
import 'package:mad_1_gamenova_1/views/widgets/button.dart';

class ItemPortraitView extends StatelessWidget {
  final Game game;
  final int amount;
  final bool isWishlist;
  final VoidCallback onRemove;
  final VoidCallback? onCart;
  const ItemPortraitView({
    super.key,
    required this.game,
    required this.amount,
    required this.isWishlist,
    required this.onRemove,
    this.onCart,
  });

  @override
  Widget build(BuildContext context) {
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
            MyButton("Remove", onRemove, Colors.white),
            if (isWishlist && onCart != null)
              MyButton("Add to Cart", onCart!, Colors.black),
          ],
        ),
      ),
    );
  }
}
