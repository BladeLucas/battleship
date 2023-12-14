import 'package:flutter/material.dart';
import 'package:battleship/game_setup.dart';
//import 'package:battleship/settings.dart';
void main() {
  runApp(const Main());
}
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
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
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const GameSetup();
                    },
                  ),
                );
              },
              child: Text(
                "PLAY",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ))
        ],
      ),
    );
  }
}
