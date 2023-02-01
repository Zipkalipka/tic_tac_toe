import '../models/game_tile.dart';
import '../models/player.dart';

enum Compass { NW_SE, W_E, SW_NE, N_S }

class _Vector {
  int x1;
  int x2;
  int y1;
  int y2;

  _Vector(this.x1, this.y1, this.x2, this.y2);
}

winCondition(int tileId, List<GameTile> gameTiles, int fieldSize) {
  _Vector vector;

  int calcDir(int x, int y, int tileId, List<GameTile> gameTiles, int fieldSize) {
    int dirPoints = 0;
    int checkTileId = tileId;
    while ((checkTileId >= 0) && (checkTileId < (fieldSize * fieldSize))) {
      if (gameTiles[tileId].tileStatus == gameTiles[checkTileId].tileStatus) {
        dirPoints++;
        if ((checkTileId % fieldSize == 0) ||
            ((checkTileId + 1) % fieldSize == 0)){
          break;
        }
      }
      checkTileId = checkTileId + (x * fieldSize + y);
    }
    return dirPoints;
  }

  for (var dirs in Compass.values) {
    int points = 0;
    switch (dirs) {
      case Compass.N_S:
        vector = _Vector(-1, 0, 1, 0);
        break;
      case Compass.NW_SE:
        vector = _Vector(-1, -1, 1, 1);
        break;
      case Compass.W_E:
        vector = _Vector(0, -1, 0, 1);
        break;
      case Compass.SW_NE:
        vector = _Vector(1, -1, -1, 1);
        break;
    }
    points =
        points + calcDir(vector.x1, vector.y1, tileId, gameTiles, fieldSize);
    points =
        points + calcDir(vector.x2, vector.y2, tileId, gameTiles, fieldSize);
    points = points - 1;
    print('${dirs.name} scores $points');
  }
}
