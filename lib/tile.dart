import 'package:battleship/ship.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final bool isSelected;
  final Ship? ship;
  const Tile({super.key, required this.isSelected, required this.ship});

  @override
  Widget build(BuildContext context) {
    Color? tileColor;

    if (isSelected) {
      tileColor = Colors.green;
    } else {
      tileColor = Colors.white;
    }

    return Container(
      decoration: BoxDecoration(
          color: tileColor, border: Border.all(color: Colors.black, width: 1)),
      child: ship != null ? Image.asset(ship!.imagePath) : null,
    );
  }
}
