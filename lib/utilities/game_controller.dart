
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/game_tile.dart';
import 'win_condition_list.dart';

enum Players {player1, player2}
enum Result {player1Win, player2Win, draw}
enum GameState{newGame, inProgress, ended}
enum GameMode{solo, duel}

class GameController extends ChangeNotifier {

  GameController(){
    initBoard();
  }

  int fieldSize = 3;
  late List<GameTile> gameBoard;
  Players currentPlayer = Players.player1;
  late Result result;
  GameMode gameMode=GameMode.duel;
  GameState gameState=GameState.newGame;
  int gameTurn = 1;

  void soloMode (){
    gameMode=GameMode.solo;
    notifyListeners();
  }

  void duelMode(){
    gameMode=GameMode.duel;
    notifyListeners();
  }

  void decreaseFieldSize() {
    if (fieldSize>3){
      fieldSize--;
      initBoard();
      notifyListeners();
    }
  }

  void increaseFieldSize() {
    if (fieldSize<7){
      fieldSize++;
      initBoard();
      notifyListeners();
    }
  }

  void startNewGame(){
    fieldSize=3;
    gameTurn=1;
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
      gameBoard[tileId].turn=gameTurn;
      print(gameTurn);
      gameTurn++;

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
      if ((gameState==GameState.inProgress)&&(gameMode==GameMode.duel)) {
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
    gameTurn=1;
    notifyListeners();
  }

  void _changeTurn() {
    currentPlayer =
        (currentPlayer == Players.player1) ? Players.player2 : Players.player1;
  }
}
