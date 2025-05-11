import "dart:convert";
import "package:flutter/services.dart";

class UIConfigService {
  Map<String, dynamic> _config = {};

  Future<void> loadConfig() async {
    final raw = await rootBundle.loadString("assets/ui_config.json");
    _config = json.decode(raw);
    print("UI config loaded.");
  }

  dynamic get(String key) => _config[key];
}
