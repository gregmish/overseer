class FallbackHandler {
  static String onNull(String? input, {String fallback = "N/A"}) {
    return input ?? fallback;
  }

  static String safeRun(Function func) {
    try {
      return func().toString();
    } catch (e) {
      return "Error: \$e";
    }
  }
}
