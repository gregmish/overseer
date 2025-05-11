class MinionLog {
  final List<String> logs = [];

  void add(String message) {
    final time = DateTime.now().toIso8601String();
    final full = "MINION [\$time]: \$message";
    logs.add(full);
    print(full);
  }

  void dump() {
    for (var log in logs) {
      print(log);
    }
  }
}
