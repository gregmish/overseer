class VoiceParser {
  String cleanInput(String raw) {
    return raw.trim().toLowerCase();
  }

  bool matchesCommand(String input, String expected) {
    return cleanInput(input) == expected.toLowerCase();
  }
}
