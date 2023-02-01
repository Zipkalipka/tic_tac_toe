import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/game_tile.dart';
import 'win_condition_list.dart';

enum Players { player1, player2, ai }

class GameController extends ChangeNotifier {
  final fieldSize = 3;
  late List<GameTile> gameBoard;
  Players currentPlayer = Players.player1;
  Players winner = Players.player1;

  initBoard() {
    // for (int i = 0; i <= fieldSize * fieldSize; i++) {
    //   gameBoard.add(GameTile(i));
    // }
    gameBoard = List<GameTile>.generate(fieldSize* fieldSize, (index) => GameTile(index));
    return gameBoard;
  }

  updateTile(int tileId) {
    if (gameBoard[tileId].tileStatus == TileStatus.empty) {
      switch (currentPlayer) {
        case Players.player1:
          gameBoard[tileId].tileStatus = TileStatus.cross;
          break;
        case Players.player2:
          gameBoard[tileId].tileStatus = TileStatus.circle;
          break;
        case Players.ai:
          // TODO: Handle this case.
          break;
      }
      if (winCheck(tileId, gameBoard, fieldSize)!=null){
        return Players.player1;
      } else if (winner==TileStatus.circle){
        return Players.player2;
      }

      _changeTurn();
      notifyListeners();
    }
    return null;
  }

  void resetBoard() {
    for (var tiles in gameBoard) {
      tiles.tileStatus = TileStatus.empty;
    }
    currentPlayer = Players.player1;
    notifyListeners();
  }

  void _changeTurn() {
    currentPlayer =
        (currentPlayer == Players.player1) ? Players.player2 : Players.player1;
  }

}
