class ProfitDashboard {
  double earnings = 0.0;

  void logSale(double amount) {
    earnings += amount;
    print("💰 Sale logged: \$amount | Total: \$earnings");
  }

  void reset() {
    earnings = 0.0;
    print("Profit data reset.");
  }
}
