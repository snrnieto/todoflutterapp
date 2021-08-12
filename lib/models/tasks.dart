class Tasks {
  String title;
  bool isDone;

  Tasks({
    required this.title,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
