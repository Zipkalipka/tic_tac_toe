import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/game_screen.dart';
import 'package:provider/provider.dart';
import 'utilities/game_controller.dart';

void main() {
  runApp(const MyApp());
 // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>GameController(),
      child: const MaterialApp(
        title: 'Tic-Tac-Toe',
        home: GameScreen(),
        //navigatorKey: navigatorKey,
      ),
    );
  }
}
