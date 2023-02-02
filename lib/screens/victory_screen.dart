import 'package:flutter/material.dart';
import '../utilities/game_controller.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/utilities/design_constants.dart';

class VictoryScreen extends StatelessWidget {
  const VictoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String victoryText;
    GameController gameController =
        Provider.of<GameController>(context, listen: false);
    switch (gameController.result) {
      case Result.player1Win:
        if (gameController.gameMode==GameMode.solo){
          victoryText = 'You Won!\nGet Some Friends!';
        } else {
          victoryText = 'Player 1 Wins';
        }
        break;
      case Result.player2Win:
        victoryText = 'Player 2 Wins';
        break;
      case Result.draw:
        victoryText = 'Draw';
        break;
    }
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 100),
      child: SizedBox(
        height: 230,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game Over',
              style: customTextStyle(20),
            ),
            const SizedBox(height: 10,),
            Text(
              victoryText,
              style: customTextStyle(20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                gameController.startNewGame();
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(150, 50)),
              child: Text('New Game', style: customTextStyle(20)),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  gameController.resetBoard();
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(150, 50)),
                child: Text('Rematch', style: customTextStyle(20))),
          ],
        ),
      ),
    );
  }
}
