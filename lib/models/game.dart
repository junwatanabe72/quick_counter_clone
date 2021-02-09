class Game {
  String mode;
  int count;
  int time;
  bool inPlay;
  bool isClear;

  Game(
      {this.mode,
      this.count,
      this.inPlay = false,
      this.isClear = false,
      this.time});
}
