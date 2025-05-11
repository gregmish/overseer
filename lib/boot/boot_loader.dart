class BootLoader {
  bool isFirstBoot = true;

  void run() {
    if (isFirstBoot) {
      print("Booting Overseer for the first time...");
      isFirstBoot = false;
    } else {
      print("Booting normally.");
    }
  }
}
