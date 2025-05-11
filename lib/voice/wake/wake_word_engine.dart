class WakeWordEngine {
  final List<String> triggers = ["overseer", "oi mate", "wake up"];

  bool detect(String input) {
    final lower = input.toLowerCase();
    return triggers.any((t) => lower.contains(t));
  }

  void respond() {
    print("👂 Wake word detected. Awaiting command...");
  }
}
