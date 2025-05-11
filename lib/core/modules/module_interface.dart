/// Base class for self-loading modules in Overseer.
abstract class OverseerModule {
  String get id;
  Map<String, dynamic> get metadata => {};
  void onLoad() => print("ℹ️ Module [$id] loaded.");
  void execute() => print("▶️ Module [$id] execution started.");
  void onUnload() => print("❌ Module [$id] unloaded.");
  void safeExecute(Function action) {
    try {
      action();
    } catch (e, stackTrace) {
      print("❌ Error in module [$id]: $e\n$stackTrace");
    }
  }
}
