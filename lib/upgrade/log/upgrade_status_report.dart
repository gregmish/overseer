import "dart:convert";

class UpgradeStatusReport {
  final List<_UpgradeLog> _logs = [];

  void logSuccess(String message) => _addLog(message, UpgradeStatus.success);
  void logFailure(String message) => _addLog(message, UpgradeStatus.failure);
  void logSkipped(String message) => _addLog(message, UpgradeStatus.skipped);

  void printSummary() {
    final s = _logs.where((l) => l.status == UpgradeStatus.success);
    final f = _logs.where((l) => l.status == UpgradeStatus.failure);
    final x = _logs.where((l) => l.status == UpgradeStatus.skipped);

    print("──── Upgrade Summary ────");
    print("✅ Success: \${s.length}");
    print("❌ Failure: \${f.length}");
    print("⚠️ Skipped: \${x.length}");
    print("─────────────────────────");
  }

  String exportReport() {
    final report = {
      "successes": _logs.where((l) => l.status == UpgradeStatus.success).map((l) => l.toJson()).toList(),
      "failures": _logs.where((l) => l.status == UpgradeStatus.failure).map((l) => l.toJson()).toList(),
      "skipped": _logs.where((l) => l.status == UpgradeStatus.skipped).map((l) => l.toJson()).toList(),
    };
    return jsonEncode(report);
  }

  void reset() {
    _logs.clear();
    print("🗑️ Cleared report.");
  }

  void _addLog(String msg, UpgradeStatus status) {
    _logs.add(_UpgradeLog(message: msg, status: status, timestamp: DateTime.now().toIso8601String()));
  }
}

enum UpgradeStatus { success, failure, skipped }

class _UpgradeLog {
  final String message;
  final UpgradeStatus status;
  final String timestamp;

  _UpgradeLog({required this.message, required this.status, required this.timestamp});

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status.toString().split(".").last,
    "timestamp": timestamp,
  };
}
