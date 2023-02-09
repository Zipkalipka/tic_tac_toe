import 'package:flutter/material.dart';
import '../elements/victory_screen_elements/turn_history_scroll_wheel.dart';
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
          victoryText = 'You Won!';
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
      insetPadding: const EdgeInsets.symmetric(horizontal: 0),
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20,top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Game Over',
                    style: customTextStyle(30),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    victoryText,
                    style: customTextStyle(30),
                  ),
                ],
              ),
              Column(
                children: [
                  const HistoryScroll(),
                  Text('Swipe to see turns',style: customTextStyle(20))
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 15,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      gameController.startNewGame();
                    },
                    style: ElevatedButton.styleFrom(fixedSize: const Size(150, 50),padding: EdgeInsets.zero),
                    child: Text('New Game', style: customTextStyle(25)),
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
                      child: Text('Rematch', style: customTextStyle(25))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
