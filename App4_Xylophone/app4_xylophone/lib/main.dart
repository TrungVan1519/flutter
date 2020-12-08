import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  void displayAudio(int soundIndex) {
    AudioCache audioCache = new AudioCache();
    audioCache.play('note$soundIndex.wav');
  }

  Expanded createFlatButton({Color color, int soundIndex}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          displayAudio(soundIndex);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
//            mainAxisAlignment: MainAxisAlignment.center,
//            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              createFlatButton(color: Colors.red, soundIndex: 1),
              createFlatButton(color: Colors.orange, soundIndex: 2),
              createFlatButton(color: Colors.yellow, soundIndex: 3),
              createFlatButton(color: Colors.green, soundIndex: 4),
              createFlatButton(color: Colors.blue, soundIndex: 5),
              createFlatButton(color: Colors.brown, soundIndex: 6),
              createFlatButton(color: Colors.purple, soundIndex: 7),
            ],
          ),
        ),
      ),
    );
  }
}
