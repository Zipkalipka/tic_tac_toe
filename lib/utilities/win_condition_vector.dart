import '../models/game_tile.dart';
import 'dart:math';

winCheck(GameTile lastTile, List<GameTile> gameTiles, int fieldSize, int winScore) {
  int xLast = lastTile.fieldId % fieldSize;
  int yLast = lastTile.fieldId ~/ fieldSize;

  for (double angle = 0; angle <= 3 * pi / 4; angle += pi / 4) {
    if (_lineWalk(xLast,yLast,angle, gameTiles, lastTile, fieldSize)>=winScore){
      return lastTile.tileStatus;
    }
  }
  return null;
}
_lineWalk(int x, int y, double angle, List<GameTile> gameTiles, GameTile lastTile, int fieldSize ) {
  int score = 0;
  int dx,dy,cx,cy;
  for (double dAngle = 0; dAngle <= pi; dAngle += pi) {
    dx = (cos(angle + dAngle)).round();
    dy = (sin(angle + dAngle)).round();
    cx=x;
    cy=y;
    while (gameTiles[fieldSize  * cy + cx].tileStatus == lastTile.tileStatus) {
      score += 1;
      cx += dx;
      cy += dy;
      if ((cx < 0) || (cy < 0) || (cx >= fieldSize) || (cy >= fieldSize)) {
        break;
      }
    }
  }
  return score-1;
}

