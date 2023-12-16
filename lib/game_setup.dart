import 'dart:math';

import 'package:battleship/battleship.dart';
import 'package:battleship/ship.dart';
import 'package:battleship/tile.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const Setup());
// }

// class GameSetup extends StatelessWidget {
//   const GameSetup({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false, home: Setup(theme: true));
//   }
// }

class Setup extends StatefulWidget {
  final bool theme;
  final bool music;
  const Setup({super.key, required this.theme, required this.music});

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

    print("Reset board started");
    int carrierAttempts = 0;
    print("Place Carrier");
    while (carrierPlaced == false) {
      if (carrierDirection) {
        late bool checkTile;
        for (int i = 0; i < carrierSize; i++) {
          checkTile =
              newGame[carrierRow + i][carrierCol] == null ? true : false;
          print(newGame[carrierRow + i][carrierCol]);
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
            newGame[carrierRow + i][carrierCol] = Ship(
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
              newGame[carrierRow][carrierCol + i] == null ? true : false;
          print(newGame[carrierRow][carrierCol + i]);
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
            newGame[carrierRow][carrierCol + i] = Ship(
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
              newGame[battleshipRow + i][battleshipCol] == null ? true : false;
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
            newGame[battleshipRow + i][battleshipCol] = Ship(
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
              newGame[battleshipRow][battleshipCol + i] == null ? true : false;
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
            newGame[battleshipRow][battleshipCol + i] = Ship(
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
              newGame[submarineRow + i][submarineCol] == null ? true : false;
          print(checkTile);
          print(newGame[submarineRow + i][submarineCol]);
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
            newGame[submarineRow + i][submarineCol] = Ship(
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
              newGame[submarineRow][submarineCol + i] == null ? true : false;
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
            newGame[submarineRow][submarineCol + i] = Ship(
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
          checkTile = newGame[rescueRow + i][rescueCol] == null ? true : false;
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
            newGame[rescueRow + i][rescueCol] = Ship(
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
          checkTile = newGame[rescueRow][rescueCol + i] == null ? true : false;
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
            newGame[rescueRow][rescueCol + i] = Ship(
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
          checkTile = newGame[patrolRow + i][patrolCol] == null ? true : false;
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
            newGame[patrolRow + i][patrolCol] = Ship(
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
          checkTile = newGame[patrolRow][patrolCol + i] == null ? true : false;
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
            newGame[patrolRow][patrolCol + i] = Ship(
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

    board = newGame;
  }

  bool randomDirection() {
    bool direction = Random().nextBool();
    return direction;
  }

  void randomize() {
    setState(() {
      initializeGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    //Color color = Colors.white;

    return Scaffold(
      backgroundColor: widget.theme ? Colors.lightBlue : Colors.grey,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: widget.theme ? Colors.lightBlue : Colors.grey,
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
            height: 450,
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
          SizedBox(
              width: 250,
              height: 75,
              child: ElevatedButton(
                  onPressed: randomize,
                  child: Text(
                    "Randomize Ships",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ))),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: SizedBox(
                  width: 250,
                  height: 75,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Game(
                                      board: board,
                                      theme: widget.theme,
                                      music: widget.music,
                                    )),
                            (route) => false);
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w800),
                      )))),

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
