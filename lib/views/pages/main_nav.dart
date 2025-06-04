import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/views/pages/cart.dart';
import 'package:mad_1_gamenova_1/views/pages/home.dart';
import 'package:mad_1_gamenova_1/views/pages/physical_products.dart';
import 'package:mad_1_gamenova_1/views/pages/wishlist.dart';

class MainNavScreen extends StatefulWidget {
  final int selectPageIndex;
  const MainNavScreen({super.key, required this.selectPageIndex});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  void navigate(BuildContext context, int index) {
    if (index != widget.selectPageIndex) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MainNavScreen(selectPageIndex: index);
          },
        ),
      );
    }
  }

  Widget getPage() {
    if (widget.selectPageIndex == 1) {
      return PhysicalScreen();
    }
    if (widget.selectPageIndex == 2) {
      return WishlistScreen();
    }
    if (widget.selectPageIndex == 3) {
      return CartScreen();
    } else {
      return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("GameNova", style: TextStyle(fontSize: 32))),
      ),
      body: getPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.selectPageIndex,
        onTap: (value) {
          navigate(context, value);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.games), label: "Games"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Wishlist"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
