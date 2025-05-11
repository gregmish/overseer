import "dart:convert";
import "dart:typed_data";

class EncryptedCommandPipeline {
  String encrypt(String input) {
    final bytes = utf8.encode(input);
    return base64.encode(bytes);
  }

  String decrypt(String encoded) {
    final bytes = base64.decode(encoded);
    return utf8.decode(bytes);
  }
}
