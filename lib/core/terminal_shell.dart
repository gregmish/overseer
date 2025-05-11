import "commands/built_in_commands.dart";

class OverseerTerminal {
  final List<OverseerCommand> _commands = builtInCommands;

  String execute(String input) {
    final parts = input.trim().split(" ");
    final name = parts.first.toLowerCase();

    for (var cmd in _commands) {
      if (cmd.name == name) {
        return cmd.run(input);
      }
    }
    return "Unknown command: \$name";
  }

  List<String> getCommandList() {
    return _commands.map((c) => c.name).toList();
  }
}
