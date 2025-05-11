class ResponseReturn {
  String wrap(String result) {
    final timestamp = DateTime.now().toIso8601String();
    return "[OK @ \$timestamp] → \$result";
  }

  String error(String msg) {
    final timestamp = DateTime.now().toIso8601String();
    return "[ERROR @ \$timestamp] → \$msg";
  }
}
