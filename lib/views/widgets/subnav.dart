import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/views/pages/digital_products.dart';
import 'package:mad_1_gamenova_1/views/pages/physical_products.dart';

Widget buildSubNav(context) {
  return Container(
    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PhysicalScreen()),
            );
          },
          child: Text("Physical", style: TextStyle(fontSize: 18)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DigitalScreen()),
            );
          },
          child: Text("Digital", style: TextStyle(fontSize: 18)),
        ),
      ],
    ),
  );
}
