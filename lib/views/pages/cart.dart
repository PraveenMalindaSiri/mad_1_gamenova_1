import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/core/game.dart';
import 'package:mad_1_gamenova_1/core/games_lists.dart';
import 'package:mad_1_gamenova_1/views/widgets/itemLanscape.dart';
import 'package:mad_1_gamenova_1/views/widgets/itemPortrait.dart';

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
                        return ItemLanscapeView(
                          game: entries[index].key,
                          amount: entries[index].value,
                          isWishlist: false,
                          onRemove: () => remove(entries[index].key),
                        );
                      } else {
                        return ItemPortraitView(
                          game: entries[index].key,
                          amount: entries[index].value,
                          isWishlist: false,
                          onRemove: () => remove(entries[index].key),
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
