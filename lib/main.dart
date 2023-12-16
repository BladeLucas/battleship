import 'package:flutter/material.dart';
import 'package:battleship/game_setup.dart';
import 'package:battleship/settings.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MainMenu());
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Main(theme: true, music: true));
  }
}

class Main extends StatefulWidget {
  final bool theme;
  final bool music;
  const Main({super.key, required this.theme, required this.music});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final music = AudioPlayer();

  void loadMusic() async {
    if (widget.music) {
      await music.play(AssetSource('music/Battle.mp3'));
    } else {
      await music.stop();
    }

    //await music.
  }

  void stopMusic() async {
    await music.stop();
  }

  @override
  Widget build(BuildContext context) {
    loadMusic();
    if (!widget.music) {
      stopMusic();
    }
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SizedBox(
                  width: 250,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          if (widget.theme) {
                            return const Setup(
                              theme: true,
                              music: true,
                            );
                          } else {
                            return const Setup(
                              theme: false,
                              music: false,
                            );
                          }
                        },
                      ), (route) => false);
                    },
                    child: Text(
                      "PLAY",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  ))),
          Padding(
              padding: EdgeInsets.all(30),
              child: SizedBox(
                width: 250,
                height: 75,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const Settings(theme: true);
                        },
                      ), (route) => false);
                    },
                    child: Text(
                      "SETTINGS",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                      textDirection: TextDirection.ltr,
                    )),
              )),
        ],
      ),
    );
  }
}
