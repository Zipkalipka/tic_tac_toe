import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../elements/new_game_screen_elements/bottom_new_game.dart';
import '../elements/game_screen_elements/bottom_play_mode.dart';
import '../elements/new_game_screen_elements/game_mode_selection.dart';
import '../elements/gameboard_gen.dart';
import '../elements/game_screen_elements/turn_box.dart';
import 'game_controller.dart';

List<Widget> layoutSelector(context) {
  List<Widget> layout;
  GameController gameController = Provider.of<GameController>(context);
  if (gameController.gameState==GameState.newGame){
    layout=const [
      GameModeSelection(),
      SizedBox.square(
        dimension: 300,child: GameBoard(screen: GameScreen.game,),),
      BottomNewGame()
    ];
  } else {
    layout=const[
      TurnBox(),
      SizedBox.square(
          dimension: 300,child: GameBoard(screen: GameScreen.game),),
      BottomPlayMode()
    ];
  }
  return layout;
}