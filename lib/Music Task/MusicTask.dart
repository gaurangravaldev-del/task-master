import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Musictask extends StatefulWidget {
  const Musictask({super.key});

  @override
  State<Musictask> createState() => _MusictaskState();
}

class _MusictaskState extends State<Musictask> {
  bool myvalue = false;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: myvalue,
              activeColor: Colors.black,
              activeTrackColor: Colors.grey,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.grey,
              onChanged: (bool value) {
                setState(() {
                  myvalue = value;
                });
                if (value == true) {
                  musicPlay(value);
                } else {
                  musicPause(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> musicPlay(bool value) async {
    await player.setUrl(
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    );
    await player.play();
  }

  Future<void> musicPause(bool value) async {
    await player.pause();
  }
}
