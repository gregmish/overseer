import 'speech_input_controller.dart';
import 'wake_word_engine.dart';
import '../core/terminal/terminal_shell.dart';

class MicListenerService {
  final SpeechInputController _inputController = SpeechInputController();
  final WakeWordEngine _wakeEngine = WakeWordEngine();
  bool _active = false;

  Future<void> start({Function? onWakeWordDetected, Function? onVoiceInput}) async {
    print("🎙️ MicListener: Starting...");
    try {
      await _inputController.init();
      if (!_inputController.isAvailable()) {
        print("❌ Speech input not available.");
        return;
      }

      _inputController.startListening((recognized) {
        print("🗣️ Voice heard: $recognized");
        if (onVoiceInput != null) onVoiceInput(recognized);

        if (_wakeEngine.detect(recognized)) {
          print("👂 Wake word detected.");
          if (onWakeWordDetected != null) {
            onWakeWordDetected();
          } else {
            TerminalShell.handleCommand("wake");
          }
        } else {
          print("🔇 No wake word detected.");
        }
      });

      _active = true;
    } catch (e) {
      print("❌ Error starting MicListener: $e");
    }
  }

  void stop() {
    if (!_active) {
      print("⚠️ MicListener is not active.");
      return;
    }
    try {
      _inputController.stopListening();
      _active = false;
      print("🎙️ MicListener: Stopped.");
    } catch (e) {
      print("❌ Error stopping MicListener: $e");
    }
  }

  void cancel() {
    if (!_active) {
      print("⚠️ MicListener is not active.");
      return;
    }
    try {
      _inputController.cancelListening();
      _active = false;
      print("🎙️ MicListener: Cancelled.");
    } catch (e) {
      print("❌ Error cancelling MicListener: $e");
    }
  }

  bool isListening() => _active;

  void updateWakeWordConfig(Map<String, dynamic> config) {
    try {
      _wakeEngine.updateConfig(config);
      print("⚙️ Wake word engine configuration updated.");
    } catch (e) {
      print("❌ Error updating wake word configuration: $e");
    }
  }
}
