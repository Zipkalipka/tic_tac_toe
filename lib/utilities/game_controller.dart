
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/game_tile.dart';
import 'win_condition_list.dart';

enum Players {player1, player2}
enum Result {player1Win, player2Win, draw}
enum GameState{newGame, inProgress, ended}

class GameController extends ChangeNotifier {

  GameController(){
    initBoard();
  }

  int fieldSize = 3;
  late List<GameTile> gameBoard;
  Players currentPlayer = Players.player1;
  late Result result;
  GameState gameState=GameState.newGame;

  void changeFieldSize(String action){
    if ((action=='+')&&fieldSize<7){
      fieldSize++;
    } else if (((action=='-')&&fieldSize>3)) {
      fieldSize--;
    }
    initBoard();
    notifyListeners();
  }

  void startNewGame(){
    fieldSize=3;
    currentPlayer=Players.player1;
    gameState=GameState.newGame;
    initBoard();
    notifyListeners();
  }

  void start(){
    gameState=GameState.inProgress;
    notifyListeners();
  }

  void initBoard() {
    gameBoard = List<GameTile>.generate(fieldSize* fieldSize, (index) => GameTile(index));
    gameState=GameState.newGame;
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
          gameState=GameState.ended;
          break;
        case TileStatus.circle:
          result=Result.player2Win;
          gameState=GameState.ended;
          break;
        case TileStatus.cross:
          result=Result.player1Win;
          gameState=GameState.ended;
          break;
      }
      if (gameState!=GameState.ended) {
        _changeTurn();
      }
      notifyListeners();
    }
  }

  void resetBoard() {
    for (var tiles in gameBoard) {
      tiles.tileStatus = TileStatus.empty;
    }
    currentPlayer = Players.player1;
    gameState=GameState.inProgress;
    notifyListeners();
  }

  void _changeTurn() {
    currentPlayer =
        (currentPlayer == Players.player1) ? Players.player2 : Players.player1;
  }
}
