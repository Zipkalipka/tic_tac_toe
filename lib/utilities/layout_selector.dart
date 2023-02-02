import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modules/bottom_new_game.dart';
import '../modules/bottom_play_mode.dart';
import '../modules/game_mode_selection.dart';
import '../modules/gameboard.dart';
import '../modules/turn_box.dart';
import 'game_controller.dart';

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