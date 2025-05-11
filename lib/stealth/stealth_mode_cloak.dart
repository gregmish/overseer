class StealthModeCloak {
  bool enabled = false;

  void activate() {
    enabled = true;
    print("🕶️ Stealth mode ON.");
  }

  void deactivate() {
    enabled = false;
    print("🕶️ Stealth mode OFF.");
  }

  bool isActive() => enabled;
}
