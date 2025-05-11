class RemoteSignalReceiver {
  void listen() {
    print("Waiting for remote signal...");
    // Future implementation: link with webhook or signal push
  }

  void trigger(String source) {
    print("Received command from: \$source");
  }
}
