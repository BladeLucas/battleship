import 'dart:math';
import 'package:battleship/ship.dart';

List<List<Ship?>> generateEnemyBoard() {
  int patrolSize = 2;
  int rescueSize = 2;
  int submarineSize = 3;
  int battleshipSize = 4;
  int carrierSize = 5;
  bool randomDirection() {
    bool direction = Random().nextBool();
    return direction;
  }

  List<List<Ship?>> enemyBoard =
      List.generate(10, (index) => List.generate(10, (index) => null));

  int patrolRow = Random().nextInt(8);
  int patrolCol = Random().nextInt(8);
  int rescueRow = Random().nextInt(8);
  int rescueCol = Random().nextInt(8);
  int submarineRow = Random().nextInt(7);
  int submarineCol = Random().nextInt(7);
  int battleshipRow = Random().nextInt(6);
  int battleshipCol = Random().nextInt(6);
  int carrierRow = Random().nextInt(5);
  int carrierCol = Random().nextInt(5);

  bool patrolDirection = randomDirection();
  bool rescueDirection = randomDirection();
  bool submarineDirection = randomDirection();
  bool battleshipDirection = randomDirection();
  bool carrierDirection = randomDirection();

  bool patrolPlaced = false;
  bool rescuePlaced = false;
  bool submarinePlaced = false;
  bool battleshipPlaced = false;
  bool carrierPlaced = false;

  int carrierAttempts = 0;
  print("Place Carrier");
  while (carrierPlaced == false) {
    if (carrierDirection) {
      late bool checkTile;
      for (int i = 0; i < carrierSize; i++) {
        checkTile =
            enemyBoard[carrierRow + i][carrierCol] == null ? true : false;
        print(enemyBoard[carrierRow + i][carrierCol]);
        print(checkTile);
        if (!checkTile) {
          carrierAttempts++;
          if (carrierAttempts > 1) {
            carrierRow = Random().nextInt(5);
            carrierCol = Random().nextInt(5);
            print("Carrier New coords:$carrierRow,$carrierCol");
          }
        }
      }
      if (carrierAttempts == 0) {
        for (int i = 0; i < carrierSize; i++) {
          enemyBoard[carrierRow + i][carrierCol] = Ship(
              type: ShipType.carrier,
              size: carrierSize,
              imagePath: 'images/ships/carrier5.png',
              isHit: false);

          //mark the ship as placed
          carrierPlaced = true;
        }
      } else {
        carrierRow = Random().nextInt(5);
        carrierCol = Random().nextInt(5);
        print("Carrier New coords:$carrierRow,$carrierCol");
        carrierAttempts = 0;
      }
    } else {
      late bool checkTile;
      for (int i = 0; i < carrierSize; i++) {
        checkTile =
            enemyBoard[carrierRow][carrierCol + i] == null ? true : false;
        print(enemyBoard[carrierRow][carrierCol + i]);
        print(checkTile);
        if (!checkTile) {
          carrierAttempts++;
          if (carrierAttempts > 1) {
            carrierRow = Random().nextInt(5);
            carrierCol = Random().nextInt(5);
            print("Carrier New coords:$carrierRow,$carrierCol");
          }
        }
      }
      if (carrierAttempts == 0) {
        for (int i = 0; i < carrierSize; i++) {
          enemyBoard[carrierRow][carrierCol + i] = Ship(
              type: ShipType.carrier,
              size: carrierSize,
              imagePath: 'images/ships/carrier5.png',
              isHit: false);

          //mark the ship as placed
          carrierPlaced = true;
        }
      } else {
        carrierRow = Random().nextInt(5);
        carrierCol = Random().nextInt(5);
        print("Carrier New coords:$carrierRow,$carrierCol");
        carrierAttempts = 0;
      }
    }
  }

  print("Place Battleship");
  int battleshipAttempts = 0;
  while (battleshipPlaced == false) {
    if (battleshipDirection) {
      late bool checkTile;
      for (int i = 0; i < battleshipSize; i++) {
        checkTile =
            enemyBoard[battleshipRow + i][battleshipCol] == null ? true : false;
        print(checkTile);
        if (!checkTile) {
          battleshipAttempts++;
          if (battleshipAttempts > 1) {
            battleshipRow = Random().nextInt(5);
            battleshipCol = Random().nextInt(5);
            print("Battleship New coords:$battleshipRow,$battleshipCol");
          }
        }
      }
      if (battleshipAttempts == 0) {
        for (int i = 0; i < battleshipSize; i++) {
          enemyBoard[battleshipRow + i][battleshipCol] = Ship(
              type: ShipType.battleship,
              size: battleshipSize,
              imagePath: 'images/ships/battleship4.png',
              isHit: false);

          //mark the ship as placed
          battleshipPlaced = true;
        }
      } else {
        battleshipRow = Random().nextInt(6);
        battleshipCol = Random().nextInt(6);
        print("battleship New coords:$battleshipRow,$battleshipCol");
        battleshipAttempts = 0;
      }
    } else {
      late bool checkTile;
      for (int i = 0; i < battleshipSize; i++) {
        checkTile =
            enemyBoard[battleshipRow][battleshipCol + i] == null ? true : false;
        print(checkTile);
        if (!checkTile) {
          battleshipAttempts++;
          if (battleshipAttempts > 1) {
            battleshipRow = Random().nextInt(6);
            battleshipCol = Random().nextInt(6);
            print("Battleship New coords:$battleshipRow,$battleshipCol");
          }
        }
      }
      if (battleshipAttempts == 0) {
        for (int i = 0; i < battleshipSize; i++) {
          enemyBoard[battleshipRow][battleshipCol + i] = Ship(
              type: ShipType.battleship,
              size: battleshipSize,
              imagePath: 'images/ships/battleship4.png',
              isHit: false);

          //mark the ship as placed
          battleshipPlaced = true;
        }
      } else {
        battleshipRow = Random().nextInt(6);
        battleshipCol = Random().nextInt(6);
        print("battleship New coords:$battleshipRow,$battleshipCol");
        battleshipAttempts = 0;
      }
    }
  }

  print("Place Submarine");
  int submarineAttempts = 0;
  while (submarinePlaced == false) {
    if (submarineDirection) {
      late bool checkTile;
      for (int i = 0; i < submarineSize; i++) {
        checkTile =
            enemyBoard[submarineRow + i][submarineCol] == null ? true : false;
        print(checkTile);
        print(enemyBoard[submarineRow + i][submarineCol]);
        if (!checkTile) {
          submarineAttempts++;
          print(submarineAttempts);
          if (submarineAttempts > 1) {
            submarineRow = Random().nextInt(7);
            submarineCol = Random().nextInt(7);
            print("Submarine New coords:$submarineRow,$submarineCol");
          }
        }
      }
      if (submarineAttempts == 0) {
        for (int i = 0; i < submarineSize; i++) {
          enemyBoard[submarineRow + i][submarineCol] = Ship(
              type: ShipType.submarine,
              size: submarineSize,
              imagePath: 'images/ships/submarine3.png',
              isHit: false);

          //mark the ship as placed
          submarinePlaced = true;
        }
      } else {
        submarineRow = Random().nextInt(7);
        submarineCol = Random().nextInt(7);
        print("Submarine New coords:$submarineRow,$submarineCol");
        submarineAttempts = 0;
      }
    } else {
      late bool checkTile;
      for (int i = 0; i < submarineSize; i++) {
        checkTile =
            enemyBoard[submarineRow][submarineCol + i] == null ? true : false;
        print(checkTile);
        if (!checkTile) {
          submarineAttempts++;
          print(submarineAttempts);
          if (submarineAttempts > 1) {
            submarineRow = Random().nextInt(7);
            submarineCol = Random().nextInt(7);
            print("Submarine New coords:$submarineRow,$submarineCol");
          }
        }
      }
      if (submarineAttempts == 0) {
        for (int i = 0; i < submarineSize; i++) {
          enemyBoard[submarineRow][submarineCol + i] = Ship(
              type: ShipType.submarine,
              size: submarineSize,
              imagePath: 'images/ships/submarine3.png',
              isHit: false);

          //mark the ship as placed
          submarinePlaced = true;
        }
      } else {
        submarineRow = Random().nextInt(7);
        submarineCol = Random().nextInt(7);
        print("Submarine New coords:$submarineRow,$submarineCol");
        submarineAttempts = 0;
      }
    }
  }

  print("Place Rescue Ship");
  int rescueAttempts = 0;
  while (rescuePlaced == false) {
    if (rescueDirection) {
      late bool checkTile;
      for (int i = 0; i < rescueSize; i++) {
        checkTile = enemyBoard[rescueRow + i][rescueCol] == null ? true : false;
        print(checkTile);
        if (!checkTile) {
          rescueAttempts++;
          if (rescueAttempts > 1) {
            rescueRow = Random().nextInt(8);
            rescueCol = Random().nextInt(8);
            print("Rescue New coords:$rescueRow,$rescueCol");
          }
        }
      }
      if (rescueAttempts == 0) {
        for (int i = 0; i < rescueSize; i++) {
          enemyBoard[rescueRow + i][rescueCol] = Ship(
              type: ShipType.rescue,
              size: rescueSize,
              imagePath: 'images/ships/rescueShip2.png',
              isHit: false);

          //mark the ship as placed
          rescuePlaced = true;
        }
      } else {
        rescueRow = Random().nextInt(8);
        rescueCol = Random().nextInt(8);
        print("rescue New coords:$rescueRow,$rescueCol");
        rescueAttempts = 0;
      }
    } else {
      late bool checkTile;
      for (int i = 0; i < rescueSize; i++) {
        checkTile = enemyBoard[rescueRow][rescueCol + i] == null ? true : false;
        print(checkTile);
        if (!checkTile) {
          rescueAttempts++;
          if (rescueAttempts > 1) {
            rescueRow = Random().nextInt(8);
            rescueCol = Random().nextInt(8);
            print("Rescue New coords:$rescueRow,$rescueCol");
          }
        }
      }
      if (rescueAttempts == 0) {
        for (int i = 0; i < rescueSize; i++) {
          enemyBoard[rescueRow][rescueCol + i] = Ship(
              type: ShipType.rescue,
              size: rescueSize,
              imagePath: 'images/ships/rescueShip2.png',
              isHit: false);

          //mark the ship as placed
          rescuePlaced = true;
        }
      } else {
        rescueRow = Random().nextInt(8);
        rescueCol = Random().nextInt(8);
        print("rescue New coords:$rescueRow,$rescueCol");
        rescueAttempts = 0;
      }
    }
  }

  print("Place Patrol Boat");
  int patrolAttempts = 0;
  while (patrolPlaced == false) {
    if (patrolDirection) {
      late bool checkTile;
      for (int i = 0; i < patrolSize; i++) {
        checkTile = enemyBoard[patrolRow + i][patrolCol] == null ? true : false;
        print(checkTile);
        if (!checkTile) {
          patrolAttempts++;
          if (patrolAttempts > 1) {
            patrolRow = Random().nextInt(8);
            patrolCol = Random().nextInt(8);
            print("Patrol New coords:$patrolRow,$patrolCol");
          }
        }
      }
      if (patrolAttempts == 0) {
        for (int i = 0; i < patrolSize; i++) {
          enemyBoard[patrolRow + i][patrolCol] = Ship(
              type: ShipType.patrol,
              size: patrolSize,
              imagePath: 'images/ships/patrolBoat1.png',
              isHit: false);

          //mark the ship as placed
          patrolPlaced = true;
        }
      } else {
        patrolRow = Random().nextInt(8);
        patrolCol = Random().nextInt(8);
        print("patrol New coords:$patrolRow,$patrolCol");
        patrolAttempts = 0;
      }
    } else {
      late bool checkTile;
      for (int i = 0; i < patrolSize; i++) {
        checkTile = enemyBoard[patrolRow][patrolCol + i] == null ? true : false;
        print(checkTile);
        print(checkTile);
        if (!checkTile) {
          patrolAttempts++;
          if (patrolAttempts > 1) {
            patrolRow = Random().nextInt(8);
            patrolCol = Random().nextInt(8);
            print("Patrol New coords:$patrolRow,$patrolCol");
          }
        }
      }
      if (patrolAttempts == 0) {
        for (int i = 0; i < patrolSize; i++) {
          enemyBoard[patrolRow][patrolCol + i] = Ship(
              type: ShipType.patrol,
              size: patrolSize,
              imagePath: 'images/ships/patrolBoat1.png',
              isHit: false);

          //mark the ship as placed
          patrolPlaced = true;
        }
      } else {
        patrolRow = Random().nextInt(8);
        patrolCol = Random().nextInt(8);
        print("patrol New coords:$patrolRow,$patrolCol");
        patrolAttempts = 0;
      }
    }
  }

  return enemyBoard;
}
