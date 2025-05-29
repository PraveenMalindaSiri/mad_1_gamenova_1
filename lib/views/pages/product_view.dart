import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/core/game.dart';

class ProductViewScreen extends StatefulWidget {
  final Game game;

  const ProductViewScreen({super.key, required this.game});
  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  Widget myIMG(String path) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(path, fit: BoxFit.fill, width: 300, height: 300),
      ),
    );
  }

  Widget buildPortrait() {
    return Container(
      decoration: BoxDecoration(color: Colors.black87),
      child: Column(
        children: [
          Text(
            widget.game.name,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "Rs.${widget.game.price}",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          myIMG(widget.game.image),
          Text(
            widget.game.description,
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Text(
            "Edition: ${widget.game.type}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "Released Date: ${widget.game.releasedDate}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "Age Rating: ${widget.game.ageRating}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "Size: ${widget.game.size}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "Platform: ${widget.game.platform}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "Company: ${widget.game.company}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "Duration: ${widget.game.duration}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "Genre: ${widget.game.genre}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget buildLandscape() {
    return Container(
      decoration: BoxDecoration(color: Colors.black87),
      child: Column(
        children: [
          Row(
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
          Row(
            children: [
              Column(
                children: [
                  Text(
                    widget.game.description,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Edition: ${widget.game.type}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Released Date: ${widget.game.releasedDate}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Age Rating: ${widget.game.ageRating}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
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
                  Text(
                    "Company: ${widget.game.company}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Duration: ${widget.game.duration}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Genre: ${widget.game.genre}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
