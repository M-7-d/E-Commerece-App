class TPricingCalculator {
  static double calculateTotalPrice(double ProductPrice, String Location) {
    double taxRate = getTaxRateForLocation(Location);
    double taxAmount = ProductPrice * taxRate;

    double ShippingCost = getShippingCost(Location);

    double totalPrice = ProductPrice + taxAmount + ShippingCost;
    return totalPrice;
  }

  static String calculateShippingCost(double ProductPrice, String Location) {
    double shippingCost = getShippingCost(Location);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double ProductPrice, String Location) {
    double taxRate = getTaxRateForLocation(Location);
    double taxAmount = ProductPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String Location) {
    return 0.10;
  }

  static double getShippingCost(String Location) {
    return 5;
  }
}
