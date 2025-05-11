import "dart:io";
import "package:archive/archive_io.dart";

class ZipUnpacker {
  final String inputPath;
  final String outputPath;

  ZipUnpacker({
    this.inputPath = "/storage/emulated/0/Download",
    this.outputPath = "/storage/emulated/0/Download/unpacked",
  });

  void unpackAllZips() {
    final dir = Directory(inputPath);
    if (!dir.existsSync()) return;

    final zips = dir.listSync().whereType<File>().where((f) => f.path.endsWith(".zip"));
    for (var zip in zips) {
      final bytes = zip.readAsBytesSync();
      final archive = ZipDecoder().decodeBytes(bytes);
      final outDir = Directory(outputPath)..createSync(recursive: true);

      for (final file in archive) {
        final path = "\${outDir.path}/\${file.name}";
        if (file.isFile) {
          File(path)..createSync(recursive: true)..writeAsBytesSync(file.content as List<int>);
        } else {
          Directory(path).createSync(recursive: true);
        }
      }
      print("✅ Unpacked: \${zip.path}");
    }
  }
}
