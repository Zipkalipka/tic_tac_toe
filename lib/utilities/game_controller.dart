
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/game_tile.dart';
import 'win_condition_list.dart';

enum Players {player1, player2}
enum Result {player1Win, player2Win, draw}

class GameController extends ChangeNotifier {
  int fieldSize = 3;
  late List<GameTile> gameBoard;
  Players currentPlayer = Players.player1;
  Result result=Result.draw;
  bool gameEnded = false;

  initBoard() {
    gameBoard = List<GameTile>.generate(fieldSize* fieldSize, (index) => GameTile(index));
    return gameBoard;
  }

  void updateTile(int tileId) {
    if (gameBoard[tileId].tileStatus == TileStatus.empty) {
      switch (currentPlayer) {
        case Players.player1:
          gameBoard[tileId].tileStatus = TileStatus.cross;
          break;
        case Players.player2:
          gameBoard[tileId].tileStatus = TileStatus.circle;
          break;
      }
      switch (winCheck(tileId, gameBoard, fieldSize)) {
        case null:
          break;
        case 'Draw' :
          result=Result.draw;
          gameEnded = true;
          break;
        case TileStatus.circle:
          result=Result.player2Win;
          gameEnded = true;
          break;
        case TileStatus.cross:
          result=Result.player1Win;
          gameEnded = true;
          break;
      }
      _changeTurn();
      notifyListeners();
    }
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
