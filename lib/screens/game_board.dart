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
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: layoutSelector(context),
        ),
      ),
    );
  }
}

class GameModeSelection extends StatelessWidget {
  const GameModeSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool soloChecked;
    bool duelChecked;
    GameController gameController = Provider.of<GameController>(context);
    if (gameController.gameMode==GameMode.solo) {
      soloChecked = true;
      duelChecked=false;
    } else {
      duelChecked=true;
      soloChecked=false;
    }
    return SizedBox(
      height: 250,
      width: 400,
      child: Center(
        child:
          Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Solo', style: customTextStyle(30),),
                Transform.scale(
                  scale: 2,
                  child: Checkbox(value: soloChecked, onChanged: (bool? value) {
                      gameController.soloMode();
                  }),
                ),
              ],
            ),
            const SizedBox(width: 70,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('Duel', style: customTextStyle(30),),
              Transform.scale(
                scale: 2,
                child: Checkbox(value: duelChecked, onChanged: (bool? value) {
                    gameController.duelMode();
                }),
              ),
            ],)
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
              gameIcon = const Icon(Icons.close);
              break;
            case TileStatus.circle:
              gameIcon = const Icon(Icons.brightness_1_outlined);
              break;
          }
          return ElevatedButton(
            style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {
              if (gameController.gameState != GameState.newGame) {
                gameController.updateTile(index);
                if (gameController.gameState == GameState.ended) {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) => const VictoryScreen());
                }
              }
            },
            child:SizedBox.expand(child: FittedBox(fit:BoxFit.contain, child: gameIcon)),
          );
        },
      ),
    );
  }
}

class BottomNewGame extends StatelessWidget {
  const BottomNewGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameController gameController = Provider.of<GameController>(context);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          Text('Choose Field Size', style: customTextStyle(30),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(60, 60)),
                  onPressed: () {
                    gameController.decreaseFieldSize();
                  },
                  child: const Icon(Icons.arrow_back_ios, size: 50)),
              const SizedBox(width: 30,),
              Text('${gameController.fieldSize}', style: customTextStyle(40)),
              const SizedBox(width: 30,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(fixedSize: const Size(60, 60)),
                  onPressed: () {
                    gameController.increaseFieldSize();
                  },
                  child: const Icon(Icons.arrow_forward_ios, size: 50))
            ],
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
              onPressed: () {
                gameController.start();
              },
              child: Text('Start', style: customTextStyle(40),))
        ],
      );
  }
}
class BottomPlayMode extends StatelessWidget {
  const BottomPlayMode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GameController gameController = Provider.of<GameController>(context);
    return Column(children: [
      const SizedBox(
        height: 100,
      ),
      ElevatedButton(
          style: ElevatedButton.styleFrom(fixedSize: const Size(300, 100),padding: EdgeInsets.zero),
          onPressed: () {
            gameController.resetBoard();
          },
          onLongPress: () {
            gameController.startNewGame();
          },
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text('Press to Restart',
                  style: customTextStyle(25),),
                Text('Hold for a New Game',
                  style: customTextStyle(25),)
              ]
          )
      ),
    ]
    );
  }
}

List<Widget> layoutSelector(context) {
  List<Widget> layout;
  GameController gameController = Provider.of<GameController>(context);
  if (gameController.gameState==GameState.newGame){
    layout=const [
      GameModeSelection(),
      GameBoard(),
      BottomNewGame()
    ];
  } else {
    layout=const[
      TurnBox(),
      GameBoard(),
      BottomPlayMode()
    ];
  }
  return layout;
}
