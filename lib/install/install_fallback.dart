class InstallFallback {
  bool installOk = false;

  void runCheck() {
    if (!installOk) {
      print("Fallback triggered: standard install failed. Running safe mode.");
    } else {
      print("Install verified.");
    }
  }
}
