import 'dart:math';

import 'package:battleship/ship.dart';

List<List<bool>> hitboard =
    List.generate(10, (index) => List.generate(10, (index) => false));
List<List<bool>> missboard =
    List.generate(10, (index) => List.generate(10, (index) => false));

bool lastShot = false;
int lastDirection = -1;
late int lastxcoord;
late int lastycoord;
String shipName = "";

int carrierHits = 0;
int battleshipHits = 0;
int submarineHits = 0;
int rescueHits = 0;
int patrolHits = 0;
int shipsSunk = 0;

bool enemyTurn(List<List<Ship?>> playerboard) {
  print("Enemy Turn");

  late bool hit;

  int xcoord = 0;
  int ycoord = 0;
  late int randDirection;

  bool directionChosen = false;
  bool shotTaken = false;
  shipName = "";

  while (!directionChosen) {
    if (lastShot) {
      if (lastDirection != 0 ||
          lastDirection != 1 ||
          lastDirection != 2 ||
          lastDirection != 3) {
        randDirection = Random().nextInt(3);
      } else {
        randDirection = lastDirection;
      }

      switch (randDirection) {
        case 0: //up
          if (lastycoord != 0) {
            xcoord = lastxcoord;
            ycoord = lastycoord - 1;
            directionChosen = true;
          }
          break;
        case 1: //right
          if (lastxcoord != 9) {
            xcoord = lastxcoord + 1;
            ycoord = lastycoord;
            directionChosen = true;
          }
          break;
        case 2: //down
          if (lastycoord != 9) {
            xcoord = lastxcoord;
            ycoord = lastycoord + 1;
            directionChosen = true;
          }
          break;
        case 3: //left
          if (lastxcoord != 0) {
            xcoord = lastxcoord - 1;
            ycoord = lastycoord;
            directionChosen = true;
          }
          break;
        default:
      }
    } else {
      xcoord = Random().nextInt(9);
      ycoord = Random().nextInt(9);
      directionChosen = true;
    }
  }

  while (!shotTaken) {
    if (hitboard[xcoord][ycoord] != true && missboard[xcoord][ycoord] != true) {
      if (playerboard[xcoord][ycoord] != null) {
        hitboard[xcoord][ycoord] = true;
        hit = true;
        shotTaken = true;
        lastxcoord = xcoord;
        lastycoord = ycoord;
        if (lastShot) {
          lastDirection = randDirection;
        }
        shipHits(xcoord, ycoord, playerboard);
        lastShot = true;
        print("Enemy Hit your ${playerboard[xcoord][ycoord]?.type}");
      } else {
        missboard[xcoord][ycoord] = true;
        hit = false;
        shotTaken = true;
        lastShot = false;
        lastDirection = -1;
        print("Enemy Missed!");
      }
    } else {
      xcoord = Random().nextInt(9);
      ycoord = Random().nextInt(9);
    }
  }
  return hit;
}

List<List<bool>> playerHitBoard() {
  List<List<bool>> hb = hitboard;
  return hb;
}

List<List<bool>> playerMissBoard() {
  List<List<bool>> mb = missboard;
  return mb;
}

void shipHits(int row, int col, List<List<Ship?>> playerboard) {
  switch (playerboard[row][col]?.type) {
    case ShipType.carrier:
      carrierHits++;
      break;
    case ShipType.battleship:
      battleshipHits++;
      break;
    case ShipType.submarine:
      submarineHits++;
      break;
    case ShipType.rescue:
      rescueHits++;
      break;
    case ShipType.patrol:
      patrolHits++;
      break;
    default:
  }
}

String shipSinker() {
  if (carrierHits == 5) {
    shipName = "Carrier";
    shipsSunk++;
    carrierHits = 0;
  } else if (battleshipHits == 4) {
    shipName = "Battleship";
    shipsSunk++;
    battleshipHits = 0;
  } else if (submarineHits == 3) {
    shipName = "Submarine";
    shipsSunk++;
    submarineHits = 0;
  } else if (rescueHits == 2) {
    shipName = "Rescue Ship";
    shipsSunk++;
    rescueHits = 0;
  } else if (patrolHits == 2) {
    shipName = "Patrol Boat";
    shipsSunk++;
    patrolHits = 0;
  }
  return shipName;
}

bool enemyWinChecker() {
  bool winChecker = false;
  if (shipsSunk == 5) {
    winChecker = true;
  }
  return winChecker;
}
