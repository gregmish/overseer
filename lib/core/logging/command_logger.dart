class CommandLogger {
  final List<String> logs = [];

  void log(String command) {
    final timestamp = DateTime.now().toIso8601String();
    logs.add("[\$timestamp] \$command");
    print("📦 Command logged: \$command");
  }

  void printLogs() {
    print("📜 Command Log:");
    for (var log in logs) {
      print(" - \$log");
    }
  }

  void clear() {
    logs.clear();
    print("📦 Command log cleared.");
  }
}
