import '../core/terminal/terminal_shell.dart';
import '../gpt/gpt_config.dart';
import '../gpt/gpt_api_service.dart';
import 'speech_mode_manager.dart';

/// Routes voice input to the appropriate action (wake, terminal, or GPT).
class VoiceCommandRouter {
  final SpeechModeManager _voiceManager;

  /// A map of system commands for easier extensibility.
  final Map<String, Function> _systemCommands = {};

  VoiceCommandRouter(this._voiceManager) {
    _initializeSystemCommands();
  }

  /// Initializes system commands to simplify routing.
  void _initializeSystemCommands() {
    _systemCommands["enable voice"] = _voiceManager.enableVoice;
    _systemCommands["disable voice"] = _voiceManager.disableVoice;
    _systemCommands["status"] = _reportStatus;
  }

  /// Routes voice input to the appropriate handler.
  Future<void> route(String input) async {
    final trimmed = input.trim().toLowerCase();

    if (_isWakeCommand(trimmed)) {
      final command = _extractCommand(trimmed);
      if (command.isNotEmpty) {
        TerminalShell.handleCommand(command);
        return;
      }
    }

    if (_systemCommands.containsKey(trimmed)) {
      _systemCommands[trimmed]!();
      return;
    }

    await _handleGPTResponse(trimmed);
  }

  bool _isWakeCommand(String input) {
    return input.startsWith("overseer") || input.startsWith("hey overseer");
  }

  String _extractCommand(String input) {
    return input.replaceFirst(RegExp(r'^.*?overseer'), '').trim();
  }

  Future<void> _handleGPTResponse(String input) async {
    if (GPTConfig.apiKey.isEmpty) {
      print("❌ Cannot send to GPT — API key not set.");
      return;
    }

    try {
      final gpt = GPTApiService(apiKey: GPTConfig.apiKey, model: GPTConfig.model);
      final response = await gpt.sendMessage(input);
      print("🤖 GPT: $response");
      await _voiceManager.speakIfEnabled(response);
    } catch (e) {
      print("❌ Error communicating with GPT: $e");
      await _voiceManager.speakIfEnabled("I'm sorry, I couldn't process your request.");
    }
  }

  void _reportStatus() {
    final status = _voiceManager.isVoiceEnabled()
        ? "Voice mode is currently ENABLED."
        : "Voice mode is currently DISABLED.";
    print("ℹ️ Status: $status");
    _voiceManager.speakIfEnabled(status);
  }
}
