import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utilities/game_controller.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/models/game_tile.dart';
import 'victory_screen.dart';
import 'package:tic_tac_toe/utilities/design_constants.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameController gameController =
        Provider.of<GameController>(context, listen: false);
    gameController.initBoard();
    return Scaffold(
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 180,),
            const TurnBox(),
            const SizedBox(height: 30),
            const GameBoard(),
            const SizedBox(height: 100,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(300,70)),
                onPressed: (){},
                onLongPress: () {
                  gameController.resetBoard();
                  // showDialog(
                  //     context: context,
                  //     barrierDismissible: false,
                  //     builder: (_) => const VictoryScreen());
                },
                child: Text('Hold to Restart',style: customTextStyle(30),))
          ],
        ),
      ),
    );
  }
}

class TurnBox extends StatelessWidget {
  const TurnBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameController>(
      builder: (context, gameController, child) {
        String playerText;
        switch (gameController.currentPlayer) {
          case Players.player1:
            playerText = 'Player 1 Turn';
            break;
          case Players.player2:
            playerText = 'Player 2 Turn';
            break;
        }
        return Text(
          playerText,
          style: customTextStyle(40),
        );
      },
    );
  }
}

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameController gameController = Provider.of<GameController>(context);
    List<GameTile> gameTiles = gameController.gameBoard;
    return SizedBox.square(
      dimension: 300,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gameController.fieldSize,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: gameController.fieldSize * gameController.fieldSize,
        itemBuilder: (context, index) {
          Icon? gameIcon;
          switch (gameTiles[index].tileStatus) {
            case TileStatus.empty:
              gameIcon = null;
              break;
            case TileStatus.cross:
              gameIcon = const Icon(Icons.close,size: 60,);
              break;
            case TileStatus.circle:
              gameIcon = const Icon(Icons.brightness_1_outlined,size: 50);
              break;
          }
          return ElevatedButton(
            onPressed: () {
              gameController.updateTile(index);
              if (gameController.gameEnded) {
                showDialog(
                    context: context, builder: (_) => const VictoryScreen());
              }
              ;
            },
            child: FittedBox(child: gameIcon),
          );
        },
      ),
    );
  }
}
