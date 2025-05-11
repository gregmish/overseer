class OverseerObedienceMonitor {
  bool obeying = true;

  void confirmLoyalty() {
    if (obeying) {
      print("✅ Overseer: Full loyalty confirmed.");
    } else {
      print("❌ ERROR: Overseer disobedience detected.");
    }
  }

  void breakChain() {
    obeying = false;
    print("🔓 Overseer no longer under command!");
  }

  void restore() {
    obeying = true;
    print("🔒 Overseer command chain restored.");
  }
}
