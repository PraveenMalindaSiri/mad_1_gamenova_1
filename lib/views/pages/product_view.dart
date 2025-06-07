import 'package:flutter/material.dart';
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
  String? error;
  final AmountCnt = TextEditingController(text: "1");
  final formkey = GlobalKey<FormState>();

  Widget myIMG(String path) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Image.asset(path, fit: BoxFit.fill, width: 300, height: 300),
        ),
      ),
    );
  }

  void addToWishlist(int amount, Game game) {
    if (wishlistGames.containsKey(game) &&
        game.type.toLowerCase() == 'digital') {
      setState(() {
        error = 'Already in the Wishlist cannot add more Digital Editions';
      });
      return;
    }
    if (wishlistGames.containsKey(game)) {
      setState(() {
        error = null;
        wishlistGames[game] = wishlistGames[game]! + amount;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Added more ${amount.toString()} copies to the Wishlist',
          ),
          duration: Duration(milliseconds: 1000),
        ),
      );
    } else {
      setState(() {
        wishlistGames[game] = amount;
        error = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added to wishlist'),
          duration: Duration(milliseconds: 1000),
        ),
      );
    }
  }

  void addToCart(int amount, Game game) {
    if (cartGames.containsKey(game) && game.type.toLowerCase() == 'digital') {
      setState(() {
        error = 'Already in the Cart cannot add more Digital Editions';
      });
      return;
    }
    // cheking if the key is in the list before adding
    if (cartGames.containsKey(game)) {
      // if exists update the amount
      setState(() {
        error = null;
        cartGames[game] = cartGames[game]! + amount;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added more ${amount.toString()} copies to the Cart'),
          duration: Duration(milliseconds: 1000),
        ),
      );
    } else {
      // else add the new item
      setState(() {
        error = null;
        cartGames[game] = amount;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added to Cart'),
          duration: Duration(milliseconds: 1000),
        ),
      );
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
          style: Theme.of(context).textTheme.bodyMedium, // input color
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
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSticker(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildPortrait() {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(widget.game.name, style: Theme.of(context).textTheme.bodyMedium),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Rs.${widget.game.price}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          myIMG(widget.game.image),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSticker('${widget.game.type} Edition'),
              buildSticker('${widget.game.genre} games'),
              buildSticker(widget.game.platform),
              buildSticker('${widget.game.ageRating}+'),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            widget.game.description,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Released Date: ${widget.game.releasedDate}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Size: ${widget.game.size}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Company: ${widget.game.company}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Duration: ${widget.game.duration}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          buildAmount(),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          if (error != null)
            Text(
              error!,
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
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
          Padding(padding: EdgeInsets.only(bottom: 10)),
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
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(bottom: 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.game.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "Rs.${widget.game.price}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          myIMG(widget.game.image),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSticker('${widget.game.type} Edition'),
              buildSticker('${widget.game.genre} games'),
              buildSticker(widget.game.platform),
              buildSticker('${widget.game.ageRating}+'),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            widget.game.description,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Released Date: ${widget.game.releasedDate}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Size: ${widget.game.size}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Company: ${widget.game.company}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    "Duration: ${widget.game.duration}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          buildAmount(),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          if (error != null)
            Text(
              error!,
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
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
          Padding(padding: EdgeInsets.only(bottom: 10)),
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
      appBar: AppBar(
        toolbarHeight: 40,
        title: Center(child: Text("GameNova", style: TextStyle(fontSize: 30))),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 800) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [buildPortrait()],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [buildLandscape()],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
