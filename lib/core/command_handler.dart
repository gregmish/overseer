import "terminal_shell.dart";

class CommandHandler {
  final OverseerTerminal terminal = OverseerTerminal();

  String handle(String input) {
    return terminal.execute(input);
  }
}
