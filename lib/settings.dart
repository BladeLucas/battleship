import 'package:flutter/material.dart';
import 'package:battleship/main.dart';

class Settings extends StatefulWidget {
  final bool theme;
  const Settings({super.key, required this.theme});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool selectedOption = true;
  bool audioOption = true;
  bool settingtheme = true;
  bool settingmusic = true;
  bool group = true;

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
      body: Column(
        children: [
          Center(
              child: Text(
            "Settings",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
          )),
          Text(
            "Theme Options",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
          ),
          ListTile(
            title: const Text('Blue Theme'),
            leading: Radio(
              value: true,
              groupValue: group,
              onChanged: (value) {
                setState(() {
                  settingtheme = true;
                  group = settingtheme;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Grey Theme'),
            leading: Radio(
              value: false,
              groupValue: group,
              onChanged: (value) {
                setState(() {
                  settingtheme = false;
                  group = settingtheme;
                });
              },
            ),
          ),
          Text(
            "Audio Options",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
          ),
          ListTile(
            title: const Text('Music On'),
            leading: Radio(
              value: true,
              groupValue: audioOption,
              onChanged: (value) {
                setState(() {
                  settingmusic = true;
                  audioOption = settingmusic;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Music off'),
            leading: Radio(
              value: false,
              groupValue: audioOption,
              onChanged: (value) {
                setState(() {
                  settingmusic = false;
                  audioOption = settingmusic;
                });
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Main(theme: settingtheme, music: settingmusic)),
                    (route) => false);
              },
              child: Text(
                "Back",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                textDirection: TextDirection.ltr,
              ))
        ],
      ),
    );
  }
}
