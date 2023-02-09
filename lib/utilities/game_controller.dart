import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/game_tile.dart';
import 'win_condition_vector.dart';

enum Players {player1, player2}
enum Result {player1Win, player2Win, draw}
enum GameState{newGame, inProgress, ended}
enum GameMode{solo, duel}
enum GameScreen{game, victory}

class GameController extends ChangeNotifier {

  GameController(){
    initBoard();
  }

  int fieldSize = 3;
  int winScore=3;
  late List<GameTile> gameBoard;
  Players currentPlayer = Players.player1;
  late Result result;
  GameMode gameMode=GameMode.duel;
  GameState gameState=GameState.newGame;
  int gameTurn = 0;

  void soloMode (){
    gameMode=GameMode.solo;
    notifyListeners();
  }

  void duelMode(){
    gameMode=GameMode.duel;
    notifyListeners();
  }

  void decreaseWinScore() {
    if (winScore>3){
      winScore--;
      notifyListeners();
    }
  }

  void increaseWinScore() {
    if (winScore<fieldSize){
      winScore++;
      notifyListeners();
    }
  }

  void decreaseFieldSize() {
    if (fieldSize>3){
      fieldSize--;
      winScore=fieldSize;
      initBoard();
      notifyListeners();
    }
  }

  void increaseFieldSize() {
    if (fieldSize<7){
      fieldSize++;
      winScore=fieldSize;
      initBoard();
      notifyListeners();
    }
  }

  void startNewGame(){
    fieldSize=3;
    winScore=3;
    gameTurn=0;
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

  void resetBoard() {
    for (var tiles in gameBoard) {
      tiles.tileStatus = TileStatus.empty;
      tiles.turn=0;
    }
    currentPlayer = Players.player1;
    gameState=GameState.inProgress;
    gameTurn=0;
    notifyListeners();
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

      switch (winCheck(gameBoard[tileId], gameBoard, fieldSize,winScore)) {
        case null:
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

      if (gameTurn==(fieldSize*fieldSize-1)){
        result=Result.draw;
        gameState=GameState.ended;
      }

      if((gameMode==GameMode.duel)&&(gameState==GameState.inProgress)) {
        _changeTurn();
      }
      if (gameState!=GameState.newGame){
        _writeTurn(tileId);
      }
      notifyListeners();
    }
  }

  void _writeTurn(tileId){
    gameBoard[tileId].turn=gameTurn;
    gameTurn++;
  }

  void _changeTurn() {
    currentPlayer =
        (currentPlayer == Players.player1) ? Players.player2 : Players.player1;
  }
}
