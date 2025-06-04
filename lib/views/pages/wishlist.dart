import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/core/game.dart';
import 'package:mad_1_gamenova_1/core/games_lists.dart';
import 'package:mad_1_gamenova_1/views/widgets/itemLanscape.dart';
import 'package:mad_1_gamenova_1/views/widgets/itemPortrait.dart';

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

  @override
  Widget build(BuildContext context) {
    final entries = wishlistGames.entries.toList();
    if (entries.isEmpty) {
      return Center(child: Container(child: Text("No Wishlist Items")));
    } else {
      return Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                if (constraints.maxWidth > 800) {
                  return ItemLanscapeView(
                    game: entries[index].key,
                    amount: entries[index].value,
                    isWishlist: true,
                    onRemove: () => remove(entries[index].key),
                    onCart:
                        () =>
                            addToCart(entries[index].value, entries[index].key),
                  );
                } else {
                  return ItemPortraitView(
                    game: entries[index].key,
                    amount: entries[index].value,
                    isWishlist: true,
                    onRemove: () => remove(entries[index].key),
                    onCart:
                        () =>
                            addToCart(entries[index].value, entries[index].key),
                  );
                }
              },
            );
          },
        ),
      );
    }
  }
}
