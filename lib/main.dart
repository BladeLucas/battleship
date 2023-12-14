import 'package:flutter/material.dart';
import 'package:battleship/game_setup.dart';
import 'package:battleship/settings.dart';
void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
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
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Settings();
                    },
                  ),
                );
              },
              child: Text(
                "SETTINGS",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ))
        ],
      ),
    );
  }
}





