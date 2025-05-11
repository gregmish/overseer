import 'package:flutter_tts/flutter_tts.dart';

class SpeechOutputController {
  final FlutterTts _tts = FlutterTts();
  bool _isSpeaking = false;

  Function? onSpeakingStart;
  Function? onSpeakingComplete;
  Function(String)? onSpeakingError;

  SpeechOutputController({
    this.onSpeakingStart,
    this.onSpeakingComplete,
    this.onSpeakingError,
  }) {
    _configure();
  }

  void _configure() async {
    try {
      await _tts.setLanguage("en-GB");
      await _tts.setPitch(1.0);
      await _tts.setSpeechRate(0.5);
      await _tts.setVolume(1.0);

      _tts.setStartHandler(() {
        _isSpeaking = true;
        print("🔊 TTS: Speaking started.");
        if (onSpeakingStart != null) onSpeakingStart!();
      });

      _tts.setCompletionHandler(() {
        _isSpeaking = false;
        print("✅ TTS: Speaking complete.");
        if (onSpeakingComplete != null) onSpeakingComplete!();
      });

      _tts.setErrorHandler((msg) {
        _isSpeaking = false;
        print("❌ TTS Error: $msg");
        if (onSpeakingError != null) onSpeakingError!(msg);
      });
    } catch (e) {
      print("❌ TTS Configuration failed: $e");
    }
  }

  Future<void> speak(String text, {String? language, double? pitch, double? rate, double? volume}) async {
    if (_isSpeaking) {
      print("⏹️ Stopping current speech...");
      await stop();
    }

    try {
      if (language != null) await _tts.setLanguage(language);
      if (pitch != null) await _tts.setPitch(pitch);
      if (rate != null) await _tts.setSpeechRate(rate);
      if (volume != null) await _tts.setVolume(volume);

      await _tts.speak(text);
    } catch (e) {
      print("❌ TTS failed: $e");
      if (onSpeakingError != null) onSpeakingError!(e.toString());
    }
  }

  Future<void> stop() async {
    try {
      await _tts.stop();
      _isSpeaking = false;
      print("🛑 TTS: Stopped.");
    } catch (e) {
      print("❌ Error stopping TTS: $e");
      if (onSpeakingError != null) onSpeakingError!(e.toString());
    }
  }

  bool isSpeaking() => _isSpeaking;

  Future<void> updateConfig({String? language, double? pitch, double? rate, double? volume}) async {
    try {
      if (language != null) await _tts.setLanguage(language);
      if (pitch != null) await _tts.setPitch(pitch);
      if (rate != null) await _tts.setSpeechRate(rate);
      if (volume != null) await _tts.setVolume(volume);
      print("⚙️ TTS configuration updated.");
    } catch (e) {
      print("❌ Error updating TTS configuration: $e");
      if (onSpeakingError != null) onSpeakingError!(e.toString());
    }
  }

  Future<List<String>> getAvailableVoices() async {
    try {
      final voices = await _tts.getVoices;
      print("🗣️ Available voices: $voices");
      return voices.cast<String>();
    } catch (e) {
      print("❌ Error retrieving voices: $e");
      return [];
    }
  }
}
