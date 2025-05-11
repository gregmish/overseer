class MinionStatusTracker {
  final Map<String, String> _statuses = {};

  void update(String minion, String status) {
    _statuses[minion] = status;
    print("🛰️ [\$minion] Status = \$status");
  }

  String? getStatus(String minion) => _statuses[minion];

  void printAll() {
    print("🛰️ All Minion Statuses:");
    _statuses.forEach((k, v) => print(" - \$k: \$v"));
  }
}
