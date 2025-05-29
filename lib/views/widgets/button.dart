import 'package:flutter/material.dart';

Widget MyButton(String name, Function func, Color mainColor) {
  return ElevatedButton(
    onPressed: () => func(),
    style: ElevatedButton.styleFrom(
      backgroundColor: mainColor,
      foregroundColor: mainColor == Colors.white ? Colors.black : Colors.white,
      padding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      textStyle: TextStyle(fontSize: 16)
    ),
    child: Text(name),
  );
}
