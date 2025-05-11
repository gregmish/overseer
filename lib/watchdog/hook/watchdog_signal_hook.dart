class WatchdogSignalHook {
  void sendPing() {
    print("📡 Watchdog ping sent.");
  }

  void receiveResponse(String source) {
    print("📡 Watchdog received reply from: \$source");
  }
}
