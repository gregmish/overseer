/// Handles detection of wake words from voice input.
class WakeWordEngine {
  List<String> _keywords = ["overseer", "hey overseer", "wake up"];
  double _sensitivity = 0.5;

  bool detect(String input) {
    final lowered = input.toLowerCase().trim();
    return _keywords.any((word) => _fuzzyMatch(lowered, word));
  }

  bool _fuzzyMatch(String input, String keyword) {
    if (_sensitivity == 0.0) {
      return input.contains(keyword);
    }

    final distance = _levenshteinDistance(input, keyword);
    final normalizedDistance = distance / keyword.length;
    return normalizedDistance <= _sensitivity;
  }

  void updateConfig(Map<String, dynamic> config) {
    if (config.containsKey("keywords")) {
      final list = config["keywords"];
      if (list is List<String>) {
        _keywords = list.map((e) => e.toLowerCase().trim()).toList();
      } else {
        throw ArgumentError("Keywords must be a list of strings.");
      }
    }

    if (config.containsKey("sensitivity")) {
      final value = config["sensitivity"];
      if (value is double) {
        _sensitivity = value.clamp(0.0, 1.0);
      } else {
        throw ArgumentError("Sensitivity must be a double between 0.0 and 1.0.");
      }
    }
  }

  Map<String, dynamic> get status => {
    "keywords": _keywords,
    "sensitivity": _sensitivity,
  };

  int _levenshteinDistance(String a, String b) {
    final m = a.length;
    final n = b.length;
    final dp = List<List<int>>.generate(
        m + 1, (_) => List<int>.filled(n + 1, 0));

    for (var i = 0; i <= m; i++) {
      for (var j = 0; j <= n; j++) {
        if (i == 0) {
          dp[i][j] = j;
        } else if (j == 0) {
          dp[i][j] = i;
        } else if (a[i - 1] == b[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1];
        } else {
          dp[i][j] = 1 +
            [dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]].reduce((a, b) => a < b ? a : b);
        }
      }
    }

    return dp[m][n];
  }
}
