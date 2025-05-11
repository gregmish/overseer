class GoalTracker {
  final List<String> _goals = [];

  void addGoal(String goal) {
    _goals.add(goal);
    print("🎯 Goal added: \$goal");
  }

  void showGoals() {
    if (_goals.isEmpty) {
      print("🎯 No goals set.");
    } else {
      print("🎯 Goals:");
      for (var g in _goals) {
        print(" - \$g");
      }
    }
  }

  void clearGoals() {
    _goals.clear();
    print("🎯 All goals cleared.");
  }
}
