import 'package:speech_to_text/speech_to_text.dart';

class SpeechInputController {
  final SpeechToText _speech = SpeechToText();
  bool _available = false;
  bool _isListening = false;

  Future<void> init() async {
    try {
      _available = await _speech.initialize(
        onStatus: _onStatus,
        onError: _onError,
      );
      print("Speech input available: $_available");
    } catch (e) {
      print("Error initializing speech input: $e");
    }
  }

  void startListening(Function(String) onResult) {
    if (!_available || _isListening) return;
    try {
      _speech.listen(
        onResult: (result) => onResult(result.recognizedWords),
        listenFor: const Duration(minutes: 1),
        pauseFor: const Duration(seconds: 5),
        localeId: "en_US",
      );
      _isListening = true;
    } catch (e) {
      print("Error starting listening: $e");
    }
  }

  void stopListening() {
    if (_isListening) {
      _speech.stop();
      _isListening = false;
    }
  }

  void cancelListening() {
    if (_isListening) {
      _speech.cancel();
      _isListening = false;
    }
  }

  void _onStatus(String status) => print("Speech status: $status");
  void _onError(SpeechRecognitionError error) =>
      print("Speech error: ${error.errorMsg} (${error.permanent ? 'permanent' : 'temporary'})");

  bool isAvailable() => _available;
  bool isListening() => _isListening;
}
