import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/elements/tile_body.dart';
import '../models/game_tile.dart';
import '../utilities/game_controller.dart';

class GameBoard extends StatelessWidget {
  final GameScreen screen;
  final int turnToRender;

  const GameBoard({Key? key, required this.screen, this.turnToRender=0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double crossAxisSpacing;
    double mainAxisSpacing;
    if (screen == GameScreen.game) {
      crossAxisSpacing = 5;
      mainAxisSpacing = 5;
    } else /*(screen==GameScreen.victory)*/ {
      crossAxisSpacing = 3;
      mainAxisSpacing = 3;
    }

    return Consumer<GameController>(builder: (context, gameController, child) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gameController.fieldSize,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
        ),
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: gameController.fieldSize * gameController.fieldSize,
        itemBuilder: (context, index) {
          Color iconColor = Colors.white;
          IconData? gameIcon;

          if (gameController.gameBoard[index].turn >
              (gameController.gameTurn - turnToRender - 1)) {
            gameIcon = null;
          } else {
            switch (gameController.gameBoard[index].tileStatus) {
              case TileStatus.empty:
                gameIcon = null;
                break;
              case TileStatus.cross:
                gameIcon = Icons.close;
                break;
              case TileStatus.circle:
                gameIcon = Icons.brightness_1_outlined;
                break;
            }
          }
          if ((gameController.gameBoard[index].turn ==
              (gameController.gameTurn - turnToRender - 1))&&(gameIcon!=null)) {
            iconColor = Colors.orange;
          }
          return TileBody(
              screen: screen,
              index: index,
              child: SizedBox.expand(child: FittedBox(child: Icon(gameIcon,color: iconColor,))));
        },
      );
    });
  }
}
