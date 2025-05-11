import 'package:flutter/material.dart';
import 'voice/speech_mode_manager.dart';
import 'voice/mic_listener_service.dart';
import 'voice/voice_command_router.dart';

void main() {
  runApp(OverseerApp());
}

class OverseerApp extends StatefulWidget {
  @override
  State<OverseerApp> createState() => _OverseerAppState();
}

class _OverseerAppState extends State<OverseerApp> {
  final SpeechModeManager _voiceMode = SpeechModeManager();
  final MicListenerService _micListener = MicListenerService();
  late VoiceCommandRouter _router;

  bool _micActive = false;

  @override
  void initState() {
    super.initState();
    _router = VoiceCommandRouter(_voiceMode);
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      await _startMic();
    } catch (e) {
      print("❌ Error initializing mic: \$e");
    }
  }

  Future<void> _startMic() async {
    if (_micActive) {
      print("⚠️ Mic listener is already active.");
      return;
    }

    try {
      print("🎙️ Starting mic listener...");
      await _micListener.start(
        onVoiceInput: (input) {
          print("🔁 Routing voice input: \$input");
          _router.route(input);
        },
        onWakeWordDetected: () {
          print("🟢 Wake word detected — awaiting command.");
          _voiceMode.speakIfEnabled("I'm listening.");
        },
      );
      setState(() {
        _micActive = true;
      });
    } catch (e) {
      print("❌ Error starting mic listener: \$e");
      setState(() {
        _micActive = false;
      });
    }
  }

  Future<void> _stopMic() async {
    if (!_micActive) {
      print("⚠️ Mic listener is not active.");
      return;
    }

    try {
      print("🛑 Stopping mic listener...");
      _micListener.stop();
      setState(() {
        _micActive = false;
      });
    } catch (e) {
      print("❌ Error stopping mic listener: \$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overseer',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Overseer Control Panel')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "🎙️ Voice system is active",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _voiceMode.toggleVoice(),
                child: Text(_voiceMode.isVoiceEnabled()
                    ? "Disable Voice Mode"
                    : "Enable Voice Mode"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _micActive ? _stopMic() : _startMic(),
                child: Text(_micActive ? "Stop Mic Listener" : "Start Mic Listener"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stopMic();
    super.dispose();
  }
}
