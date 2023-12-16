import 'package:battleship/main.dart';
import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  //final bool theme;
  final bool win;
  final bool theme;
  final bool music;
  final int totalShots;
  final int totalHits;
  const Score(
      {super.key,
      required this.win,
      required this.totalShots,
      required this.totalHits,
      required this.theme,
      required this.music
      /*required this.theme*/
      });

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: widget.theme ? Colors.lightBlue : Colors.grey,
      backgroundColor: widget.theme ? Colors.lightBlue : Colors.grey,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: widget.theme ? Colors.lightBlue : Colors.grey,
        title: widget.win ? Text("VICTORY!") : Text("DEFEAT"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    widget.win ? "Congratulations" : "R.I.P",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                  ))),
          Text(
            "You fired ${widget.totalShots} shots",
            style: TextStyle(fontSize: 28),
          ),
          Text(
            "You were ${((widget.totalHits / widget.totalShots) * 100).toStringAsFixed(2)}% accurate",
            style: TextStyle(fontSize: 28),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Main(theme: widget.theme, music: widget.music)),
                        (route) => false);
                  });
                },
                child: Text(
                  "Main Menu",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
          )
        ],
      ),
    );
  }
}
