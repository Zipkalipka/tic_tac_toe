import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/game_board.dart';

void main() {
  runApp(const MyApp());
 // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tic-Tac-Toe',
      home: GameScreen(),
    );
  }
}
