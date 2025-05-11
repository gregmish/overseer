import "package:flutter/material.dart";

class DebugOverlayToggle {
  static OverlayEntry? _entry;

  static void toggle(BuildContext context, String msg) {
    if (_entry != null) {
      _entry?.remove();
      _entry = null;
      print("🧩 Debug overlay removed.");
    } else {
      _entry = OverlayEntry(
        builder: (_) => Positioned(
          top: 60,
          left: 20,
          child: Material(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text("🛠️ Debug: \$msg", style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
      );
      Overlay.of(context)?.insert(_entry!);
      print("🧩 Debug overlay shown.");
    }
  }
}
