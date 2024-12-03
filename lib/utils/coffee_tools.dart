class CoffeeTools {
  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup
  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cups * 8;
  }

  // Funciton for for ounces to grams
  // input is number of ounces
  //output unumber of grams
  static double ouncesToGrams(int ounces){
    if(ounces <= 0){
      throw ArgumentError();
    }
    const double gramsPerOunce = 28.34952;
    
    return ounces * gramsPerOunce;
  }

  // Function for calculating coffee for French Press
  // Input: Grams of water
  // Output: Grams of coffee
  // Conversion: water/ 14 = coffee needed

  static double frenchPressCoffee(double grams){
    // set up if statementto throw argument error for 0 or negative value.
    if(grams <= 0){
      throw ArgumentError();
    }
    var conv = 14;
    return grams / conv; // return conversion
  }

  // Function for calculating coffee for Drip Machine
  // Input: Grams of water
  // Output: Grams of coffee
  // Conversion: water/ 17 = coffee needed

  static double dripMachineCoffee(double grams){
    // set up if statement to throw argument error for 0 or negative value
    if(grams <= 0){
      throw ArgumentError();
    }
    var conv = 17;
    return grams / conv; // return conversion
  }
}
