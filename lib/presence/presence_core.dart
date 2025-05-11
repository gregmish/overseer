class PresenceCore {
  bool detected = false;

  void scan() {
    detected = DateTime.now().second % 2 == 0;
    print("Presence scan: \$detected");
  }

  bool isSomeoneHere() => detected;
}
