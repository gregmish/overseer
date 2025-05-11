class SyntheticMemory {
  final Map<String, dynamic> _store = {};

  void remember(String key, dynamic value) {
    _store[key] = value;
    print("Remembered: \$key => \$value");
  }

  dynamic recall(String key) {
    return _store[key];
  }

  void forget(String key) {
    _store.remove(key);
    print("Forgot: \$key");
  }

  void wipe() {
    _store.clear();
    print("Memory wiped.");
  }

  void dump() {
    print("Memory: \$_store");
  }
}
