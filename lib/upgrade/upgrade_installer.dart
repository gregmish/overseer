import "dart:io";

class UpgradeInstaller {
  final String unpackedPath;

  UpgradeInstaller({this.unpackedPath = "/storage/emulated/0/Download/unpacked"});

  void install() {
    final dir = Directory(unpackedPath);
    if (!dir.existsSync()) {
      print("❌ Unpacked folder not found.");
      return;
    }

    final files = dir.listSync(recursive: true).whereType<File>();
    for (var file in files) {
      if (file.path.endsWith(".dart")) {
        print("🧠 Dart: \${file.path}");
      } else if (file.path.endsWith(".json") || file.path.endsWith(".cfg")) {
        print("⚙️ Config: \${file.path}");
      } else if (file.path.endsWith(".apk")) {
        print("📲 APK: \${file.path}");
      } else {
        print("⚠️ Skipped: \${file.path}");
      }
    }
    print("✅ Install complete.");
  }
}
