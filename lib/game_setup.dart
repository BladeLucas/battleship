import 'dart:math';

import 'package:battleship/ship.dart';
import 'package:battleship/tile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GameSetup());
}

class GameSetup extends StatelessWidget {
  const GameSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Setup());
  }
}

class Setup extends StatefulWidget {
  const Setup({super.key});

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  late List<List<Ship?>> board;
  int patrolSize = 2;
  int rescueSize = 2;
  int submarineSize = 3;
  int battleshipSize = 4;
  int carrierSize = 5;

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  void initializeGame() {
    List<List<Ship?>> newGame =
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
    while (carrierPlaced == false) {
      if (carrierDirection) {
        for (int i = 0; i < carrierSize; i++) {
          bool checkTile = newGame[carrierRow + i][carrierCol] == null;
          if (checkTile == false) {
            carrierAttempts++;
            if (carrierAttempts > 1) {
              carrierRow = Random().nextInt(5);
              carrierCol = Random().nextInt(5);
              carrierAttempts = 0;
              i = 0;
            } else {
              carrierDirection = !carrierDirection;
            }
          }
        }
        if (carrierAttempts == 0) {
          for (int i = 0; i < carrierSize; i++) {
            newGame[carrierRow + i][carrierCol] = Ship(
                type: ShipType.carrier,
                size: carrierSize,
                imagePath: 'images/ships/carrier5.png');

            //mark the ship as placed
            carrierPlaced = true;
          }
        }
      } else {
        for (int i = 0; i < carrierSize; i++) {
          bool checkTile = newGame[carrierRow + i][carrierCol] == null;
          if (checkTile == false) {
            carrierAttempts++;
            if (carrierAttempts > 1) {
              carrierRow = Random().nextInt(5);
              carrierCol = Random().nextInt(5);
              carrierAttempts = 0;
              i = 0;
            } else {
              carrierDirection = !carrierDirection;
            }
          }
        }
        if (carrierAttempts == 0) {
          for (int i = 0; i < carrierSize; i++) {
            newGame[carrierRow][carrierCol + i] = Ship(
                type: ShipType.carrier,
                size: carrierSize,
                imagePath: 'images/ships/carrier5.png');

            //mark the ship as placed
            carrierPlaced = true;
          }
        }
      }
    }

    int battleshipAttempts = 0;
    while (battleshipPlaced == false) {
      if (battleshipDirection) {
        for (int i = 0; i < battleshipSize; i++) {
          bool checkTile = newGame[battleshipRow + i][battleshipCol] == null;
          if (checkTile == false) {
            battleshipAttempts++;
            if (battleshipAttempts > 1) {
              battleshipRow = Random().nextInt(6);
              battleshipCol = Random().nextInt(6);
              battleshipAttempts = 0;
              i = 0;
            } else {
              battleshipDirection = !battleshipDirection;
            }
          }
        }
        if (battleshipAttempts == 0) {
          for (int i = 0; i < battleshipSize; i++) {
            newGame[battleshipRow + i][battleshipCol] = Ship(
                type: ShipType.battleship,
                size: battleshipSize,
                imagePath: 'images/ships/battleship4.png');

            //mark the ship as placed
            battleshipPlaced = true;
          }
        }
      } else {
        for (int i = 0; i < battleshipSize; i++) {
          bool checkTile = newGame[battleshipRow + i][battleshipCol] == null;
          if (checkTile == false) {
            battleshipAttempts++;
            if (battleshipAttempts > 1) {
              battleshipRow = Random().nextInt(6);
              battleshipCol = Random().nextInt(6);
              battleshipAttempts = 0;
              i = 0;
            } else {
              battleshipDirection = !battleshipDirection;
            }
          }
        }
        if (battleshipAttempts == 0) {
          for (int i = 0; i < battleshipSize; i++) {
            newGame[battleshipRow][battleshipCol + i] = Ship(
                type: ShipType.battleship,
                size: battleshipSize,
                imagePath: 'images/ships/battleship4.png');

            //mark the ship as placed
            battleshipPlaced = true;
          }
        }
      }
    }

    int submarineAttempts = 0;
    while (submarinePlaced == false) {
      if (submarineDirection) {
        for (int i = 0; i < submarineSize; i++) {
          bool checkTile = newGame[submarineRow + i][submarineCol] == null;
          if (checkTile == false) {
            submarineAttempts++;
            if (submarineAttempts > 1) {
              submarineRow = Random().nextInt(7);
              submarineCol = Random().nextInt(7);
              submarineAttempts = 0;
              i = 0;
            } else {
              submarineDirection = !submarineDirection;
            }
          }
        }
        if (submarineAttempts == 0) {
          for (int i = 0; i < submarineSize; i++) {
            newGame[submarineRow + i][submarineCol] = Ship(
                type: ShipType.submarine,
                size: submarineSize,
                imagePath: 'images/ships/submarine3.png');

            //mark the ship as placed
            submarinePlaced = true;
          }
        }
      } else {
        for (int i = 0; i < submarineSize; i++) {
          bool checkTile = newGame[submarineRow + i][submarineCol] == null;
          if (checkTile == false) {
            submarineAttempts++;
            if (submarineAttempts > 1) {
              submarineRow = Random().nextInt(7);
              submarineCol = Random().nextInt(7);
              submarineAttempts = 0;
              i = 0;
            } else {
              submarineDirection = !submarineDirection;
            }
          }
        }
        if (submarineAttempts == 0) {
          for (int i = 0; i < submarineSize; i++) {
            newGame[submarineRow][submarineCol + i] = Ship(
                type: ShipType.submarine,
                size: submarineSize,
                imagePath: 'images/ships/submarine3.png');

            //mark the ship as placed
            submarinePlaced = true;
          }
        }
      }
    }

    int rescueAttempts = 0;
    while (rescuePlaced == false) {
      if (rescueDirection) {
        for (int i = 0; i < rescueSize; i++) {
          bool checkTile = newGame[rescueRow + i][rescueCol] == null;
          if (checkTile == false) {
            rescueAttempts++;
            if (rescueAttempts > 1) {
              rescueRow = Random().nextInt(8);
              rescueCol = Random().nextInt(8);
              rescueAttempts = 0;
              i = 0;
            } else {
              rescueDirection = !rescueDirection;
            }
          }
        }
        if (rescueAttempts == 0) {
          for (int i = 0; i < rescueSize; i++) {
            newGame[rescueRow + i][rescueCol] = Ship(
                type: ShipType.rescue,
                size: rescueSize,
                imagePath: 'images/ships/rescueShip2.png');

            //mark the ship as placed
            rescuePlaced = true;
          }
        }
      } else {
        for (int i = 0; i < rescueSize; i++) {
          bool checkTile = newGame[rescueRow + i][rescueCol] == null;
          if (checkTile == false) {
            rescueAttempts++;
            if (rescueAttempts > 1) {
              rescueRow = Random().nextInt(8);
              rescueCol = Random().nextInt(8);
              rescueAttempts = 0;
              i = 0;
            } else {
              rescueDirection = !rescueDirection;
            }
          }
        }
        if (rescueAttempts == 0) {
          for (int i = 0; i < rescueSize; i++) {
            newGame[rescueRow][rescueCol + i] = Ship(
                type: ShipType.rescue,
                size: rescueSize,
                imagePath: 'images/ships/rescueShip2.png');

            //mark the ship as placed
            rescuePlaced = true;
          }
        }
      }
    }

    int patrolAttempts = 0;
    while (patrolPlaced == false) {
      if (patrolDirection) {
        for (int i = 0; i < patrolSize; i++) {
          bool checkTile = newGame[patrolRow + i][patrolCol] == null;
          if (checkTile == false) {
            patrolAttempts++;
            if (patrolAttempts > 1) {
              patrolRow = Random().nextInt(8);
              patrolCol = Random().nextInt(8);
              patrolAttempts = 0;
              i = 0;
            } else {
              patrolDirection = !patrolDirection;
            }
          }
        }
        if (patrolAttempts == 0) {
          for (int i = 0; i < patrolSize; i++) {
            newGame[patrolRow + i][patrolCol] = Ship(
                type: ShipType.patrol,
                size: patrolSize,
                imagePath: 'images/ships/patrolBoat1.png');

            //mark the ship as placed
            patrolPlaced = true;
          }
        }
      } else {
        for (int i = 0; i < patrolSize; i++) {
          bool checkTile = newGame[patrolRow + i][patrolCol] == null;
          if (checkTile == false) {
            patrolAttempts++;
            if (patrolAttempts > 1) {
              patrolRow = Random().nextInt(8);
              patrolCol = Random().nextInt(8);
              patrolAttempts = 0;
              i = 0;
            } else {
              patrolDirection = !patrolDirection;
            }
          }
        }
        if (patrolAttempts == 0) {
          for (int i = 0; i < patrolSize; i++) {
            newGame[patrolRow][patrolCol + i] = Ship(
                type: ShipType.patrol,
                size: patrolSize,
                imagePath: 'images/ships/patrolBoat1.png');

            //mark the ship as placed
            patrolPlaced = true;
          }
        }
      }
    }

    board = newGame;
  }

  bool randomDirection() {
    bool direction = Random().nextBool();
    return direction;
  }

  void randomize() {}

  @override
  Widget build(BuildContext context) {
    //Color color = Colors.white;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.blue,
        title: Image.asset(
          'images/battleshipBanner.png',
          fit: BoxFit.scaleDown,
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              'Game Setup',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            height: 500,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10),
                itemCount: 100,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  int row = index ~/ 10;
                  int col = index % 10;

                  return Tile(
                    isSelected: false,
                    ship: board[row][col],
                  );
                }
                /*return Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      )),
                )*/

                /*return DragTarget<Color>(
                    onAccept: (data) => setState(() => color = data),
                    builder: (context, _, __) => Container(
                          height: 10,
                          width: 10,
                          child: Text(index.toString()),
                          decoration: BoxDecoration(
                              color: color,
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              )),
                        ));*/

                ),
          ),
          ElevatedButton(
              onPressed: randomize,
              child: Text(
                "Randomize Ships",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ))
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Draggable<Color>(
                  data: Colors.green,
                  child: Image.asset(
                    'images/ships/patrolBoat1.png',
                    width: 30,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                  feedback: Image.asset(
                    'images/ships/patrolBoat1.png',
                    width: 30,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                  childWhenDragging: Image.asset(
                    'images/ships/patrolBoat1.png',
                    width: 30,
                    height: 60,
                    color: const Color.fromRGBO(128, 128, 128, 0.5),
                    fit: BoxFit.fill,
                  )),
              Draggable<Color>(
                  data: Colors.green,
                  child: Image.asset(
                    'images/ships/rescueShip2.png',
                    width: 30,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                  feedback: Image.asset(
                    'images/ships/rescueShip2.png',
                    width: 30,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                  childWhenDragging: Image.asset(
                    'images/ships/rescueShip2.png',
                    width: 30,
                    height: 60,
                    color: const Color.fromRGBO(128, 128, 128, 0.5),
                    fit: BoxFit.fill,
                  )),
              Draggable<Color>(
                  data: Colors.green,
                  child: Image.asset(
                    'images/ships/submarine3.png',
                    width: 30,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  feedback: Image.asset(
                    'images/ships/submarine3.png',
                    width: 30,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  childWhenDragging: Image.asset(
                    'images/ships/submarine3.png',
                    width: 30,
                    height: 100,
                    color: const Color.fromRGBO(128, 128, 128, 0.5),
                    fit: BoxFit.fill,
                  )),
              Draggable<Color>(
                  data: Colors.green,
                  child: Image.asset(
                    'images/ships/battleship4.png',
                    width: 30,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  feedback: Image.asset(
                    'images/ships/battleship4.png',
                    width: 30,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  childWhenDragging: Image.asset(
                    'images/ships/battleship4.png',
                    width: 30,
                    height: 150,
                    color: const Color.fromRGBO(128, 128, 128, 0.5),
                    fit: BoxFit.fill,
                  )),
              Draggable<Color>(
                  data: Colors.green,
                  child: Image.asset(
                    'images/ships/carrier5.png',
                    width: 30,
                    height: 190,
                    fit: BoxFit.fill,
                  ),
                  feedback: Image.asset(
                    'images/ships/carrier5.png',
                    width: 30,
                    height: 190,
                    fit: BoxFit.fill,
                  ),
                  childWhenDragging: Image.asset(
                    'images/ships/carrier5.png',
                    width: 30,
                    height: 190,
                    color: const Color.fromRGBO(128, 128, 128, 0.5),
                    fit: BoxFit.fill,
                  )),
            ],
          ),*/
        ],
      ),
    );
  }
}
