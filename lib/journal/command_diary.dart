class CommandDiary {
  final List<String> _entries = [];

  void log(String entry) {
    _entries.add(entry);
    print("📔 Diary: \$entry");
  }

  void read() {
    print("📖 Diary Contents:");
    for (var entry in _entries) {
      print(" - \$entry");
    }
  }

  void clear() {
    _entries.clear();
    print("📔 Diary cleared.");
  }
}
