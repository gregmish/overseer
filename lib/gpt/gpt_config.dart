import "gpt_api_service.dart";

class GPTConfig {
  static String _apiKey = "";
  static String _model = "gpt-3.5-turbo";

  static void setApiKey(String key) {
    if (key.isEmpty || !key.startsWith("sk-")) {
      print("❌ Invalid API key.");
      return;
    }
    _apiKey = key;
    print("✅ API key updated.");
  }

  static void setModel(String modelName) {
    final allowed = ["gpt-3.5-turbo", "gpt-4"];
    if (!allowed.contains(modelName)) {
      print("❌ Invalid model name.");
      return;
    }
    _model = modelName;
    print("✅ GPT model set to: \$modelName");
  }

  static String status() {
    return "🔑 API: \${_apiKey.isEmpty ? 'NOT SET' : 'SET'}\n🧠 Model: \$_model";
  }

  static Future<void> testPrompt(String prompt) async {
    if (_apiKey.isEmpty) {
      print("❌ Cannot test: No API key.");
      return;
    }
    final gpt = GPTApiService(apiKey: _apiKey, model: _model);
    final reply = await gpt.sendMessage(prompt);
    print("GPT Response: \$reply");
  }

  static void reset() {
    _apiKey = "";
    _model = "gpt-3.5-turbo";
    print("🔄 Reset GPT config.");
  }
}
