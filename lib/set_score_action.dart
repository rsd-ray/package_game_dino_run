class SetScoreAction {
  final Function(int) action;
  SetScoreAction({ required this.action });

  void execute(int score) {
    action(score);
  }
}