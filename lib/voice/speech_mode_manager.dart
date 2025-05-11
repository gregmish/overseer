import 'speech_output_controller.dart';

class SpeechModeManager {
  bool _voiceEnabled = false;
  final SpeechOutputController _speaker;

  Function? onVoiceEnabled;
  Function? onVoiceDisabled;

  SpeechModeManager({
    SpeechOutputController? speaker,
    this.onVoiceEnabled,
    this.onVoiceDisabled,
  }) : _speaker = speaker ?? SpeechOutputController();

  void enableVoice() {
    if (_voiceEnabled) {
      print("⚠️ Voice mode is already ENABLED.");
      return;
    }
    _voiceEnabled = true;
    print("🔊 Voice mode: ENABLED");
    if (onVoiceEnabled != null) onVoiceEnabled!();
  }

  void disableVoice() {
    if (!_voiceEnabled) {
      print("⚠️ Voice mode is already DISABLED.");
      return;
    }
    _voiceEnabled = false;
    print("🔇 Voice mode: DISABLED");
    if (onVoiceDisabled != null) onVoiceDisabled!();
  }

  void toggleVoice() {
    _voiceEnabled = !_voiceEnabled;
    print("🎛️ Voice mode toggled: ${_voiceEnabled ? 'ON' : 'OFF'}");
    _voiceEnabled ? onVoiceEnabled?.call() : onVoiceDisabled?.call();
  }

  Future<void> speakIfEnabled(String text,
      {String? language, double? pitch, double? rate, double? volume}) async {
    if (!_voiceEnabled) {
      print("🧼 Skipped speaking (voice mode off).");
      return;
    }

    try {
      await _speaker.speak(
        text,
        language: language,
        pitch: pitch,
        rate: rate,
        volume: volume,
      );
    } catch (e) {
      print("❌ Error during speech: $e");
    }
  }

  bool isVoiceEnabled() => _voiceEnabled;

  Future<void> saveState() async {
    print("💾 Voice mode state saved: ${_voiceEnabled ? 'ENABLED' : 'DISABLED'}");
  }

  Future<void> restoreState() async {
    print("🔄 Restored voice mode state: ${_voiceEnabled ? 'ENABLED' : 'DISABLED'}");
  }
}
