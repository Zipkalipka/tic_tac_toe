import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utilities/design_constants.dart';
import '../utilities/game_controller.dart';

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