class NavigatorAction {
  final Function action;
  NavigatorAction({ required this.action });

  void execute() {
    action();
  }
}