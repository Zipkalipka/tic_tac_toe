import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/elements/gameboard_gen.dart';
import 'package:tic_tac_toe/utilities/game_controller.dart';
import '../../utilities/design_constants.dart';

class HistoryScroll extends StatelessWidget {
  const HistoryScroll({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GameController gameController = Provider.of<GameController>(context,listen: false);
    return SizedBox(
      width: 300,
      height: 300,
      child: RotatedBox(
        quarterTurns: 1,
        child: ListWheelScrollView.useDelegate(
          // perspective: 0.001, //Flip
          // diameterRatio: 0.3, //Flop

          perspective: 0.001, //SUPER
          diameterRatio: 0.01,//FLIP
          squeeze: 0.84,      //FLOP

          physics: const FixedExtentScrollPhysics(),
          itemExtent: 250,
          childDelegate: ListWheelChildLoopingListDelegate(
              children: WheelElement.wheelGen(gameController.gameTurn)),
        ),
      ),
    );
  }
}

class WheelElement extends StatelessWidget {
  final int index;

  const WheelElement({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameController gameController =
        Provider.of<GameController>(context, listen: false);
    return RotatedBox(
      quarterTurns: -1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          Text(
            'Turn ${gameController.gameTurn - index}',
            style: customTextStyle(20),
          ),
          SizedBox(
            //padding: const EdgeInsets.symmetric(horizontal: 15),
            width: 250,
            height: 250,
            child: GameBoard(
              turnToRender: index,
              screen: GameScreen.victory,
            ),
          ),
        ],
      ),
    );
  }

  static List<Widget> wheelGen(int gameTurn) {
    return List<Widget>.generate(gameTurn, (index) {
      return WheelElement(index: index);
    });
  }
}
