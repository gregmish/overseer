import "package:flutter/material.dart";

class TriggerDebugPanel {
  static OverlayEntry? _entry;

  static void show(BuildContext context, String message) {
    if (_entry != null) return;

    _entry = OverlayEntry(
      builder: (_) => Positioned(
        top: 40,
        right: 20,
        child: Material(
          color: Colors.redAccent,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text("DEBUG: \$message", style: const TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(_entry!);

    Future.delayed(const Duration(seconds: 3), () => _entry?.remove());
  }
}
