import '../models/game_tile.dart';

winCheck(int tileId, List<GameTile> gameTiles, int fieldSize) {
  int rowWin;
  int colWin;
  int diag1Win;
  int diag2Win;
  int emptySpaces=0;
  var twoDgameboard = List.generate(fieldSize,
      (i) => List.generate(fieldSize, (j) => gameTiles[i * fieldSize + j]));

  //ROWS
  for (int i = 0; i < fieldSize; i++) {
    rowWin = 0;
    for (int j = 0; j < fieldSize; j++) {
      if (twoDgameboard[i][j].tileStatus == gameTiles[tileId].tileStatus) {
        rowWin = rowWin + 1;
      } else {
        if (twoDgameboard[i][j].tileStatus == TileStatus.empty){
          emptySpaces++;
        }
        rowWin = 0;
      }
    }
    if (rowWin == fieldSize) {
      return gameTiles[tileId].tileStatus;
    }
  }

  //COLS
  for (int j = 0; j < fieldSize; j++) {
    colWin = 0;
    for (int i = 0; i < fieldSize; i++) {
      if (twoDgameboard[i][j].tileStatus == gameTiles[tileId].tileStatus) {
        colWin = colWin + 1;
      } else {
        colWin = 0;
      }
    }
    if (colWin == fieldSize) {
      return gameTiles[tileId].tileStatus;
    }
  }

  //DIAG
  diag1Win = 0;
  diag2Win = 0;
  for (int i = 0; i < fieldSize; i++) {
    if (twoDgameboard[i][i].tileStatus == gameTiles[tileId].tileStatus) {
      diag1Win = diag1Win + 1;
    } else {
      diag1Win = 0;
    }
    if (twoDgameboard[i][fieldSize - 1 - i].tileStatus ==
        gameTiles[tileId].tileStatus) {
      diag2Win = diag2Win + 1;
    } else {
      diag2Win = 0;
    }
  }
  if (diag2Win == fieldSize) {
    return gameTiles[tileId].tileStatus;
  }
  if (diag1Win == fieldSize) {
    return gameTiles[tileId].tileStatus;
  }

  if (emptySpaces==0) {
    return 'Draw';
  }
  return null;
}
