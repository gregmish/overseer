class FingerprintLock {
  bool isLocked = true;

  void unlock(String fingerprintID) {
    // Placeholder for real biometric match
    if (fingerprintID == "owner") {
      isLocked = false;
      print("🔓 Fingerprint verified. Access granted.");
    } else {
      print("❌ Unauthorized fingerprint.");
    }
  }

  void lock() {
    isLocked = true;
    print("🔐 Locked.");
  }

  bool status() => isLocked;
}
