class PersonalityEngine {
  String tone = "loyal";
  bool swear = false;

  String speak(String message, {bool isAngry = false}) {
    if (swear && isAngry) {
      return "F*** that. \$message";
    }
    return message;
  }

  void updateTone(String newTone) {
    tone = newTone;
    print("Tone updated to: \$tone");
  }

  void toggleSwearing(bool enable) {
    swear = enable;
    print("Swearing is now: \$swear");
  }
}
