 enum TileStatus { empty, cross, circle }

class GameTile {
  int fieldId;
  TileStatus tileStatus=TileStatus.empty;
  int turn = 0;

  GameTile(this.fieldId);
}