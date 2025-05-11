import "package:flutter/material.dart";
import "../core/command_handler.dart";
import "../debug/trigger_debug_panel.dart";

class UILauncherShell extends StatefulWidget {
  const UILauncherShell({super.key});

  @override
  State<UILauncherShell> createState() => _UILauncherShellState();
}

class _UILauncherShellState extends State<UILauncherShell> {
  final TextEditingController _controller = TextEditingController();
  final CommandHandler handler = CommandHandler();
  String _output = "";

  void _runCommand() {
    setState(() {
      _output = handler.handle(_controller.text);
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Overseer")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: (_) => _runCommand(),
              decoration: const InputDecoration(labelText: "Enter command"),
            ),
            const SizedBox(height: 20),
            Text(_output, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
