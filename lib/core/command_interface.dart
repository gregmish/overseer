abstract class OverseerCommand {
  final String name;
  final String description;
  final String category;

  OverseerCommand(this.name, this.description, this.category);

  String run(String input);
}
