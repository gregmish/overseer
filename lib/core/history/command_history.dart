class CommandHistory {
  final List<String> _history = [];

  void log(String command) {
    _history.add(command);
    print("History log: \$command");
  }

  void clear() => _history.clear();

  List<String> getAll() => List.from(_history);
}
