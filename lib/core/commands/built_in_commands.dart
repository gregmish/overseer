import "command_interface.dart";

class HelloCommand extends OverseerCommand {
  HelloCommand() : super("hello", "Replies with a greeting.", "General");

  @override
  String run(String input) {
    return "Hello, boss.";
  }
}

class TimeCommand extends OverseerCommand {
  TimeCommand() : super("time", "Shows current system time.", "System");

  @override
  String run(String input) {
    return DateTime.now().toString();
  }
}

List<OverseerCommand> builtInCommands = [
  HelloCommand(),
  TimeCommand(),
];
