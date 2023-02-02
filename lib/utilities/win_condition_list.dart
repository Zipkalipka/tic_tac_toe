import '../models/game_tile.dart';

winCheck(int tileId, List<GameTile> gameTiles, int fieldSize) {
  int rowWin;
  int colWin;
  int diag1Win;
  int diag2Win;
  int emptySpaces = 0;
  var twoDgameboard = List.generate(fieldSize,
      (i) => List.generate(fieldSize, (j) => gameTiles[i * fieldSize + j]));

  diag1Win = 0;
  diag2Win = 0;
  for (int i = 0; i < fieldSize; i++) {
    //DIAG
    if (twoDgameboard[i][i].tileStatus == gameTiles[tileId].tileStatus) {
      diag1Win = diag1Win + 1;
      if (diag1Win == fieldSize) {
        return gameTiles[tileId].tileStatus;
      }
    } else {
      diag1Win = 0;
    }
    if (twoDgameboard[i][fieldSize - 1 - i].tileStatus ==
        gameTiles[tileId].tileStatus) {
      diag2Win = diag2Win + 1;
      if (diag2Win == fieldSize) {
        return gameTiles[tileId].tileStatus;
      }
    } else {
      diag2Win = 0;
    }

    rowWin = 0;
    colWin = 0;
    for (int j = 0; j < fieldSize; j++) {
      //Calc Empty Spaces
      if (twoDgameboard[i][j].tileStatus == TileStatus.empty) {
        emptySpaces++;
      }
      //ROW
      if (twoDgameboard[i][j].tileStatus == gameTiles[tileId].tileStatus) {
        rowWin = rowWin + 1;
        if (rowWin == fieldSize) {
          return gameTiles[tileId].tileStatus;
        }
      } else {
        rowWin = 0;
      }
      //COL
      if (twoDgameboard[j][i].tileStatus == gameTiles[tileId].tileStatus) {
        colWin = colWin + 1;
        if (colWin == fieldSize) {
          return gameTiles[tileId].tileStatus;
        }
      } else {
        colWin = 0;
      }
    } //inner cycle end
  }
  if (emptySpaces == 0) {
    return 'Draw';
  } //outer cycle end
  return null;
}
