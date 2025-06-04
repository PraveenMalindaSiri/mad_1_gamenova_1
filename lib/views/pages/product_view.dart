import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/core/colors.dart';
import 'package:mad_1_gamenova_1/core/game.dart';
import 'package:mad_1_gamenova_1/core/games_lists.dart';
import 'package:mad_1_gamenova_1/views/widgets/button.dart';

class ProductViewScreen extends StatefulWidget {
  final Game game;

  const ProductViewScreen({super.key, required this.game});
  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  int? amount;
  final AmountCnt = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Widget myIMG(String path) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(path, fit: BoxFit.fill, width: 300, height: 300),
      ),
    );
  }

  void addToWishlist(int amount, Game game) {
    if (wishlistGames.containsKey(game)) {
      wishlistGames[game] = wishlistGames[game]! + amount;
    } else {
      wishlistGames[game] = amount;
    }
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

  Widget buildAmount() {
    return Form(
      key: formkey,
      child: SizedBox(
        width: 300,
        child: TextFormField(
          controller: AmountCnt,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return ("Please fill the Amount corectly.");
            }

            final Amount = int.tryParse(value);

            if (Amount == null) {
              return ("Amount must be a number.");
            }
            if (Amount <= 0) {
              return ("Amount must be at least 1.");
            }
            if (widget.game.type.toLowerCase() == "digital" && Amount > 1) {
              return ("You can't add more than 1 Digital Edition");
            }

            return null;
          },
          decoration: InputDecoration(
            labelText: 'Amount',
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPortrait() {
    return Container(
      decoration: BoxDecoration(color: AppColors.darkGray),
      child: Column(
        children: [
          Text(
            widget.game.name,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Rs.${widget.game.price}",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          myIMG(widget.game.image),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            widget.game.description,
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Edition: ${widget.game.type}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Released Date: ${widget.game.releasedDate}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Age Rating: ${widget.game.ageRating}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Size: ${widget.game.size}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Platform: ${widget.game.platform}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Company: ${widget.game.company}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Duration: ${widget.game.duration}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Genre: ${widget.game.genre}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          buildAmount(),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton("Add To Wishlist", () {
                if (formkey.currentState!.validate()) {
                  final amount = int.parse(AmountCnt.text);
                  addToWishlist(amount, widget.game);
                }
              }, Theme.of(context).colorScheme.secondary),
              MyButton("Add To Cart", () {
                if (formkey.currentState!.validate()) {
                  final amount = int.parse(AmountCnt.text);
                  addToCart(amount, widget.game);
                }
              }, Theme.of(context).colorScheme.secondary),
            ],
          ),

          // Row(
          //   children: [
          //     TextButton(
          //       onPressed: () {
          //         Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(builder: (context) => WishlistScreen()),
          //         );
          //       },
          //       child: Text("Wishlist"),
          //     ),
          //     TextButton(
          //       onPressed: () {
          //         Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(builder: (context) => CartScreen()),
          //         );
          //       },
          //       child: Text("Cart"),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget buildLandscape() {
    return Container(
      decoration: BoxDecoration(color: AppColors.darkGray),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.game.name,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                "Rs.${widget.game.price}",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          myIMG(widget.game.image),
          Text(
            widget.game.description,
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Edition: ${widget.game.type}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Released Date: ${widget.game.releasedDate}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Age Rating: ${widget.game.ageRating}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Size: ${widget.game.size}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Platform: ${widget.game.platform}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Company: ${widget.game.company}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Duration: ${widget.game.duration}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Genre: ${widget.game.genre}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              ),
            ],
          ),
          buildAmount(),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton("Add To Wishlist", () {
                if (formkey.currentState!.validate()) {
                  final amount = int.parse(AmountCnt.text);
                  addToWishlist(amount, widget.game);
                }
              }, Colors.black),
              MyButton("Add To Cart", () {
                if (formkey.currentState!.validate()) {
                  final amount = int.parse(AmountCnt.text);
                  addToCart(amount, widget.game);
                }
              }, Colors.black),
            ],
          ),

          // Row(
          //   children: [
          //     TextButton(
          //       onPressed: () {
          //         Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(builder: (context) => WishlistScreen()),
          //         );
          //       },
          //       child: Text("Wishlist"),
          //     ),
          //     TextButton(
          //       onPressed: () {
          //         Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(builder: (context) => CartScreen()),
          //         );
          //       },
          //       child: Text("Cart"),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return buildPortrait();
              } else {
                return buildLandscape();
              }
            },
          ),
        ),
      ),
    );
  }
}
