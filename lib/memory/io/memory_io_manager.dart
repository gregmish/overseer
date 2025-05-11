class MemoryIOManager {
  final Map<String, String> _disk = {};

  void save(String key, String value) {
    _disk[key] = value;
    print("🧠 Memory saved: \$key");
  }

  String? load(String key) {
    return _disk[key];
  }

  void erase(String key) {
    _disk.remove(key);
    print("🧠 Memory erased: \$key");
  }
}
