class MinionLoader {
  final List<String> activeMinions = [];

  void register(String minionName) {
    if (!activeMinions.contains(minionName)) {
      activeMinions.add(minionName);
      print("Minion registered: \$minionName");
    }
  }

  void showStatus() {
    print("Active Minions: \$activeMinions");
  }
}
