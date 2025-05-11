class VoiceTrigger {
  final List<String> keywords = ["overseer", "hey boss", "start listening"];

  bool detect(String input) {
    for (var key in keywords) {
      if (input.toLowerCase().contains(key)) {
        print("Voice trigger detected: \$key");
        return true;
      }
    }
    return false;
  }
}
