import "dart:io";

class UpgradeZipLoader {
  final String path = "/storage/emulated/0/Download";

  void scan() {
    final dir = Directory(path);
    if (!dir.existsSync()) return;

    final zips = dir.listSync().where((f) => f.path.endsWith(".zip"));
    for (var file in zips) {
      print("Found upgrade ZIP: \${file.path}");
      // Future: trigger unzip and phase loader
    }
  }
}
