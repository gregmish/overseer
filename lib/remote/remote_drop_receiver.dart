import "dart:io";

class RemoteDropReceiver {
  final String dropPath = "/storage/emulated/0/Download/drop/";

  void checkForDrops() {
    final dir = Directory(dropPath);
    if (!dir.existsSync()) {
      print("No drop folder found.");
      return;
    }

    final files = dir.listSync().where((f) => f.path.endsWith(".zip") || f.path.endsWith(".apk"));
    for (var f in files) {
      print("Received drop: \${f.path}");
    }
  }
}
