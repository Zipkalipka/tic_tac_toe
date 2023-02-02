import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utilities/design_constants.dart';
import '../utilities/game_controller.dart';

class TurnBox extends StatelessWidget {
  const TurnBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 400,
      child: Center(
        child:
        Consumer<GameController>(
          builder: (context, gameController, child) {
            String playerText;
            if (gameController.gameMode!=GameMode.solo) {
              switch (gameController.currentPlayer) {
                case Players.player1:
                  playerText = 'Player 1 Turn';
                  break;
                case Players.player2:
                  playerText = 'Player 2 Turn';
                  break;
              }
            } else {
              playerText ='Solo Mode';
            }
            return Text(
              playerText,
              style: customTextStyle(40),
            );
          },
        ),
      ),
    );
  }
}
