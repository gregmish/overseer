class AppWatchdog {
  bool isAlive = true;

  void ping() {
    print("App Watchdog: system alive = \$isAlive");
  }

  void triggerAlert() {
    print("⚠️ ALERT: Overseer is unresponsive.");
  }
}
