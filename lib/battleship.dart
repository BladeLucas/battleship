import 'package:audioplayers/audioplayers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:battleship/enemy.dart';
import 'package:battleship/enemyai.dart';
import 'package:battleship/score.dart';
import 'package:battleship/ship.dart';
import 'package:battleship/tile.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  final List<List<Ship?>> board;
  final bool theme;
  final bool music;
  const Game(
      {super.key,
      required this.board,
      required this.theme,
      required this.music});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  //late List<List<Char>> playerShips;
  late List<List<bool>> enemyhitboard;
  late List<List<bool>> enemymissboard;
  late List<List<Ship?>> enemyboard;
  late List<List<GameTile>> gameboard;
  late List<List<bool>> playerhitboard;
  late List<List<bool>> playermissboard;

  GameTile? selectedTile;
  int selectedRow = -1;
  int selectedCol = -1;
  int targetedRow = -1;
  int targetedCol = -1;

  int carrierHits = 0;
  int battleshipHits = 0;
  int submarineHits = 0;
  int rescueHits = 0;
  int patrolHits = 0;
  int shipsSunk = 0;

  int totalShots = 0;
  int totalHits = 0;

  bool playersTurn = true;
  bool playerWin = false;
  bool playerLoss = false;
  bool fireButton = false;
  late bool enemyHit;

  @override
  void initState() {
    super.initState();
    initializeBoard();
    enemyboard = generateEnemyBoard();
  }

  final music = AudioPlayer();
  void firingSound() async {
    await music.play(AssetSource('music/firing.mp3'));
    //await music.
  }

  void initializeBoard() {
    List<List<GameTile>> newBoard = List.generate(
        10,
        (index) => List.generate(
            10,
            (index) => GameTile(
                isSelected: false,
                hit: false,
                miss: false,
                onTap: () => selectTile)));

    List<List<bool>> newEnemyHit =
        List.generate(10, (index) => List.generate(10, (index) => false));
    List<List<bool>> newEnemyMiss =
        List.generate(10, (index) => List.generate(10, (index) => false));
    List<List<bool>> newPlayerHit =
        List.generate(10, (index) => List.generate(10, (index) => false));
    List<List<bool>> newPlayerMiss =
        List.generate(10, (index) => List.generate(10, (index) => false));

    gameboard = newBoard;
    enemyhitboard = newEnemyHit;
    enemymissboard = newEnemyMiss;
    playerhitboard = newPlayerHit;
    playermissboard = newPlayerMiss;
  }

  void checkPlayerWin() {
    if (shipsSunk == 5) {
      playerWin = true;
      endGame();
    }
  }

  void turnManager() {
    print(enemyboard);
    if (!playersTurn) {
      enemyHit = enemyTurn(widget.board);
      String shipName = shipSinker();
      setState(() {
        playerhitboard = playerHitBoard();
        playermissboard = playerMissBoard();
        if (shipName != "") {
          AwesomeDialog(
                  context: context,
                  headerAnimationLoop: false,
                  dialogType: DialogType.infoReverse,
                  title: 'OH NO!',
                  desc: 'The enemy sunk your $shipName!',
                  autoHide: const Duration(seconds: 3))
              .show();
          shipName = "";
        }
      });
      playerLoss = enemyWinChecker();
      if (playerLoss) {
        endGame();
      } else {
        playersTurn = true;
        print("Players Turn");
      }
    }
  }

  void endGame() {
    if (playerWin) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Score(
                    win: playerWin,
                    totalShots: totalShots,
                    totalHits: totalHits,
                    theme: widget.theme,
                    music: widget.music,
                  )),
          (route) => false);
    } else if (playerLoss) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Score(
                    win: playerWin,
                    totalShots: totalShots,
                    totalHits: totalHits,
                    theme: widget.theme,
                    music: widget.music,
                  )),
          (route) => false);
    }
  }

  void selectTile(int row, int col) {
    setState(() {
      selectedTile = gameboard[row][col];
      selectedRow = row;
      selectedCol = col;
      fireButton = true;
    });
  }

  void doNothing() {
    //
  }

  void fire() {
    firingSound();
    totalShots++;
    if (enemyboard[selectedRow][selectedCol] != null) {
      setState(() {
        enemyhitboard[selectedRow][selectedCol] = true;
        enemyboard[selectedRow][selectedCol]?.isHit = true;
        totalHits++;
        print("Hit");
        switch (enemyboard[selectedRow][selectedCol]?.type) {
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
      });
    } else {
      setState(() {
        enemymissboard[selectedRow][selectedCol] = true;
        print("Miss");
      });
    }
    selectedTile = null;
    targetedRow = selectedRow;
    targetedCol = selectedCol;
    selectedRow = -1;
    selectedCol = -1;
    playersTurn = false;
    fireButton = false;
  }

  @override
  Widget build(BuildContext context) {
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
        body: Column(children: [
          SizedBox(
            height: 415,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10),
                itemCount: 100,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  int row = index ~/ 10;
                  int col = index % 10;
                  bool isSelected = selectedRow == row && selectedCol == col;

                  return GameTile(
                      isSelected: isSelected,
                      hit: enemyhitboard[row][col],
                      miss: enemymissboard[row][col],
                      onTap: () => selectTile(row, col));
                }),
          ),
          Padding(
              padding: EdgeInsetsDirectional.only(top: 20.0),
              child: SizedBox(
                height: 200,
                width: 200,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 10, mainAxisExtent: 20),
                    itemCount: 100,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      int row = index ~/ 10;
                      int col = index % 10;

                      return SmallTile(
                        ship: widget.board[row][col],
                        hit: playerhitboard[row][col],
                        miss: playermissboard[row][col],
                      );
                    }),
              )),
          Text(
            "Player Board",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Visibility(
            visible: fireButton,
            child: AnimatedButton(
              //onPressed: fire,
              text: 'FIRE',
              buttonTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Colors.black),
              width: 200,
              pressEvent: () {
                fire();
                AwesomeDialog(
                    context: context,
                    dialogType: enemyhitboard[targetedRow][targetedCol]
                        ? DialogType.success
                        : DialogType.error,
                    headerAnimationLoop: false,
                    animType: enemyhitboard[targetedRow][targetedCol]
                        ? AnimType.leftSlide
                        : AnimType.rightSlide,
                    title: enemyhitboard[targetedRow][targetedCol]
                        ? 'Hit!'
                        : 'Miss!',
                    buttonsTextStyle: const TextStyle(color: Colors.black),
                    showCloseIcon: true,
                    btnOkOnPress: () {
                      //checkPlayerWin();
                      targetedRow = -1;
                      targetedCol = -1;
                      if (playerWin != true && playerLoss != true) {
                        AwesomeDialog(
                                context: context,
                                headerAnimationLoop: false,
                                dialogType: DialogType.info,
                                title: 'Enemy Turn',
                                desc: 'The Enemy is Firing!',
                                autoHide: const Duration(seconds: 5))
                            .show();
                        if (carrierHits == 5) {
                          AwesomeDialog(
                                  context: context,
                                  headerAnimationLoop: false,
                                  dialogType: DialogType.infoReverse,
                                  title: 'BOOM!',
                                  desc: 'You sunk the enemies Carrier!',
                                  autoHide: const Duration(seconds: 3))
                              .show();
                          shipsSunk++;
                          carrierHits = 0;
                        } else if (battleshipHits == 4) {
                          AwesomeDialog(
                                  context: context,
                                  headerAnimationLoop: false,
                                  dialogType: DialogType.infoReverse,
                                  title: 'BOOM!',
                                  desc: 'You sunk the enemies Battleship!',
                                  autoHide: const Duration(seconds: 3))
                              .show();
                          shipsSunk++;
                          battleshipHits = 0;
                        } else if (submarineHits == 3) {
                          AwesomeDialog(
                                  context: context,
                                  headerAnimationLoop: false,
                                  dialogType: DialogType.infoReverse,
                                  title: 'BOOM!',
                                  desc: 'You sunk the enemies Submarine!',
                                  autoHide: const Duration(seconds: 3))
                              .show();
                          shipsSunk++;
                          submarineHits = 0;
                        } else if (rescueHits == 2) {
                          AwesomeDialog(
                                  context: context,
                                  headerAnimationLoop: false,
                                  dialogType: DialogType.infoReverse,
                                  title: 'BOOM!',
                                  desc: 'You sunk the enemies Rescue Ship!',
                                  autoHide: const Duration(seconds: 3))
                              .show();
                          shipsSunk++;
                          rescueHits = 0;
                        } else if (patrolHits == 2) {
                          AwesomeDialog(
                                  context: context,
                                  headerAnimationLoop: false,
                                  dialogType: DialogType.info,
                                  title: 'BOOM!',
                                  desc: 'You sunk the enemies Patrol Boat!',
                                  autoHide: const Duration(seconds: 3))
                              .show();
                          shipsSunk++;
                          patrolHits = 0;
                        }
                        checkPlayerWin();
                        turnManager();
                      }
                    }).show();
              },
            ),
          ),
        ]));
  }
}
