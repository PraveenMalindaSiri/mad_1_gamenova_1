import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/core/colors.dart';
import 'package:mad_1_gamenova_1/core/game.dart';
import 'package:mad_1_gamenova_1/views/pages/product_view.dart';
import 'package:mad_1_gamenova_1/views/widgets/button.dart';

class ItemLanscapeView extends StatelessWidget {
  final Game game;
  final int amount;
  final bool isWishlist;
  final VoidCallback onRemove;
  final VoidCallback? onCart;
  const ItemLanscapeView({
    super.key,
    required this.game,
    required this.amount,
    required this.isWishlist,
    required this.onRemove,
    this.onCart,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkGray : Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onDoubleTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductViewScreen(game: game),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ), // ⬅️ Black border
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        game.image,
                        fit: BoxFit.fill,
                        height: 200,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      game.name,
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    "x ${amount}",
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rs.${game.price * amount}",
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  MyButton(
                    "Remove",
                    onRemove,
                    isDark ? Colors.white : Colors.black,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  if (isWishlist && onCart != null)
                    MyButton("Add to Cart", onCart!, Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
