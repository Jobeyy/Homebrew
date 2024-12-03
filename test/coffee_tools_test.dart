import 'package:flutter_test/flutter_test.dart';
import 'package:homebrew/utils/coffee_tools.dart';

void main() {
  // didn't skip because all tests pass
  group("cupsToOunces", () {
    test('calculates ounces on 1 cup', () {
      var ounces = CoffeeTools.cupsToOunces(1);
      expect(ounces, 8);
    });

    test('calculates ounces on positive number of cups', () {
      var ounces = CoffeeTools.cupsToOunces(4);
      expect(ounces, 32);
    });

    test('throws ArgumentError on zero', () {
      expect(() => CoffeeTools.cupsToOunces(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      expect(() => CoffeeTools.cupsToOunces(-1), throwsArgumentError);
    });
  });

  group("converting ounces to grams", (){
    test("converting 6 ounces to grams", (){
      var grams = CoffeeTools.ouncesToGrams(6);
      expect(grams, 170.09712);
    });

    test("converting 12 ounces to grams", (){
      var grams = CoffeeTools.ouncesToGrams(12);
      expect(grams, 340.19424);
    });

    test('throws ArgumentError on zero', () {
      expect(()=> CoffeeTools.ouncesToGrams(0), throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () {
      
      expect(()=> CoffeeTools.ouncesToGrams(-1), throwsArgumentError);
    });
  });

  group("testing french press", (){
    // test for user using 1400 g of water
    test('testing for 1400g of water', (){
      var french = CoffeeTools.frenchPressCoffee(1400);
      expect(french,100);
    });
    test('testing for 2800g of water', (){
      var french = CoffeeTools.frenchPressCoffee(2800);
      expect(french,200);
    });
    test('should throw error if we pass negative value', (){
      expect(()=> CoffeeTools.frenchPressCoffee(-1400),throwsArgumentError);
    });
    test('test for 0g of water', (){
      expect(()=> CoffeeTools.frenchPressCoffee(0),throwsArgumentError);
    });
  });
  group("Testing drip machine", () {
    test('tesing input of 1700g of water', (){
      var drip = CoffeeTools.dripMachineCoffee(1700);
      expect(drip, 100);
    });
    test('tesing input of 3400g of water', (){
      var drip = CoffeeTools.dripMachineCoffee(3400);
      expect(drip, 200);
    });
    test('should throw error if we pass negative value', (){
      expect(()=> CoffeeTools.dripMachineCoffee(-1700), throwsArgumentError);
    });
    test('test for 0g of water', (){
      expect(()=> CoffeeTools.dripMachineCoffee(0), throwsArgumentError);
    });
  });

}
