import "package:flutter/foundation.dart";

class UpgradeMonitor {
  final List<String> stages = [];
  final ValueNotifier<String> currentStage = ValueNotifier("Starting...");

  void log(String stage) {
    stages.add(stage);
    currentStage.value = stage;
    debugPrint("UPGRADE: \$stage");
  }

  List<String> history() => stages;
}
