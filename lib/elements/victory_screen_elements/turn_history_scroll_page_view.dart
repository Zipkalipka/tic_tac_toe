import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/utilities/game_controller.dart';

import '../../utilities/design_constants.dart';
import '../gameboard_gen.dart';

class HistoryScroll extends StatelessWidget {
  const HistoryScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameController gameController =
        Provider.of<GameController>(context, listen: false);
    PageController pageController = PageController(viewportFraction: 0.8);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 350,
      height: 280,
      child: PageView.builder(
          itemCount: gameController.gameTurn,
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          reverse: true,
          itemBuilder: (_, index) {
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
                  child: GameBoard(screen: GameScreen.victory,
                    turnToRender: index,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
