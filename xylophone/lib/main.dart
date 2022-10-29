import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const XylophoneApp(),
    );

Future<void> playSound(int soundNumber) async {
  final player = AudioPlayer();
  await player.setSource(
    AssetSource('note$soundNumber.wav'),
  );
  await player.resume();
}

Expanded buildKey({required Color color, required int soundNumber}) {
  return Expanded(
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
      ),
      onPressed: () {
        playSound(soundNumber);
      },
      child: const Text(''),
    ),
  );
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.red, soundNumber: 1),
              buildKey(color: Colors.orange, soundNumber: 2),
              buildKey(color: Colors.yellow, soundNumber: 3),
              buildKey(color: Colors.green, soundNumber: 4),
              buildKey(color: Colors.green.shade900, soundNumber: 5),
              buildKey(color: Colors.blue, soundNumber: 6),
              buildKey(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
