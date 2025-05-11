class GPTBridge {
  String lastPrompt = "";

  String sendPrompt(String prompt) {
    lastPrompt = prompt;
    print("GPT sent: \$prompt");
    return "Simulated GPT reply for: \$prompt"; // Future: real API integration
  }
}
