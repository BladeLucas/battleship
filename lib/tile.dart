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

class SmallTile extends StatelessWidget {
  final Ship? ship;
  final bool hit;
  final bool miss;
  const SmallTile(
      {super.key, required this.ship, required this.hit, required this.miss});

  @override
  Widget build(BuildContext context) {
    Color? tileColor;

    if (hit) {
      tileColor = Colors.red;
    } else if (miss) {
      tileColor = Colors.blue;
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

// ignore: must_be_immutable
class GameTile extends StatelessWidget {
  bool isSelected = false;
  final bool hit;
  final bool miss;
  final void Function()? onTap;
  GameTile(
      {super.key,
      required this.isSelected,
      required this.hit,
      required this.miss,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Color? tileColor;

    if (isSelected) {
      tileColor = Colors.green;
    } else if (hit) {
      tileColor = Colors.red;
    } else if (miss) {
      tileColor = Colors.blue;
    } else {
      tileColor = Colors.white;
    }

    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: tileColor,
              border: Border.all(color: Colors.black, width: 1)),
        ));
  }
}
