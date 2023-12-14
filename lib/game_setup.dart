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
  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    int tile = 0;
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
              itemBuilder: (BuildContext context, int index) {
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

                return DragTarget<Color>(
                    key: Key(tile as String),
                    onAccept: (data) => setState(() => color = data),
                    builder: (context, _, __) => Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: color,
                              border: Border.all(
                                width: 1,
                                color: Colors.black,
                              )),
                        ));
              },
            ),
          ),
          Row(
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
          ),
        ],
      ),
    );
  }
}
