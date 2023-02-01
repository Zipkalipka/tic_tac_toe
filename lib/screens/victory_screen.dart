import 'package:flutter/material.dart';
import '../utilities/game_controller.dart';
import 'package:provider/provider.dart';

class VictoryScreen extends StatelessWidget {
  const VictoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GameController gameController = Provider.of<GameController>(context);
    return Dialog(
      child: SizedBox.square(
        dimension: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Game Over'),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
              gameController.resetBoard();
            }, child: Text('New Game')),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
              gameController.resetBoard();
            }, child: Text('Ramatch'))
          ],
        ),
      ),
    );
  }
}
