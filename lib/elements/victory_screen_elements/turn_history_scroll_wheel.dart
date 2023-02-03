import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/utilities/game_controller.dart';
import 'package:tic_tac_toe/models/game_tile.dart';
import '../../utilities/design_constants.dart';

class HistoryScroll extends StatelessWidget {
  const HistoryScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FixedExtentScrollController fixedExtentScrollController=FixedExtentScrollController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 350,
      height: 280,
      child: RotatedBox(
        quarterTurns: 1,
        child: ListWheelScrollView(
            controller: fixedExtentScrollController,
            //physics: const BouncingScrollPhysics(),
            itemExtent: 10,
            children: wheelGen(context),
            ),
      ),
    );
  }
}

List<Widget> wheelGen(context){
  GameController gameController =
  Provider.of<GameController>(context, listen: false);
  return List<Widget>.generate(gameController.gameTurn, (index) {
    return RotatedBox(
      quarterTurns: -1,
      child: wheelElement(index,context),
    );
  }
  );
}

Widget wheelElement(index, context){
  GameController gameController =
  Provider.of<GameController>(context, listen: false);
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Turn ${gameController.gameTurn - index}',
        style: customTextStyle(20),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 300,
        height: 250,
        child: HistoryGenerator(
          turnToRender: index,
        ),
      ),
    ],
  );
}

class HistoryGenerator extends StatelessWidget {
  final int turnToRender;

  const HistoryGenerator({Key? key, required this.turnToRender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameController gameController =
        Provider.of<GameController>(context, listen: false);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gameController.fieldSize,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
      ),
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: gameController.fieldSize * gameController.fieldSize,
      itemBuilder: (context, index) {
        Color iconColor = Colors.white;
        IconData? gameIcon;

        if (gameController.gameBoard[index].turn ==
            (gameController.gameTurn - turnToRender - 1)) {
          iconColor = Colors.orange;
        }

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

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5)),
            ),
            SizedBox.expand(
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Icon(
                      gameIcon,
                      color: iconColor,
                    )))
          ],
        );
      },
    );
  }
}