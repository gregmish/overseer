class HiddenCommandDetector {
  final List<String> triggers = ["sea_biscuit", "protocol_x", "wipe_all"];

  bool check(String input) {
    return triggers.contains(input.trim());
  }

  void handle(String input) {
    if (input == "sea_biscuit") {
      print("💥 SELF-DESTRUCT INITIATED 💥");
      // Add full delete logic if on rooted device
    } else {
      print("Hidden command received: \$input");
    }
  }
}
