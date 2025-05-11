import "dart:convert";
import "package:http/http.dart" as http;

class GPTApiService {
  final String _apiKey;
  final String _model;
  final Uri _url = Uri.parse("https://api.openai.com/v1/chat/completions");

  GPTApiService({
    required String apiKey,
    this._model = "gpt-3.5-turbo",
  }) : _apiKey = apiKey;

  Future<String> sendMessage(String message) async {
    final headers = {
      "Authorization": "Bearer \$_apiKey",
      "Content-Type": "application/json",
    };
    final body = jsonEncode({
      "model": _model,
      "messages": [{"role": "user", "content": message}],
      "temperature": 0.7,
    });

    try {
      final response = await http.post(_url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return decoded["choices"][0]["message"]["content"];
      } else {
        return "Error: \${response.statusCode} → \${response.body}";
      }
    } catch (e) {
      return "Exception: \$e";
    }
  }
}
