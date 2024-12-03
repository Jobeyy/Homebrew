// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  late FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  group('Happy Paths', () {
    test("should give recommendation for French Press", () async {
      final frenchPressButton = find.byValueKey('french-press-button');
      await driver.tap(frenchPressButton);

      final continueButton = find.byValueKey('continue-button');
      await driver.tap(continueButton);

      final cupsInputField = find.byValueKey('cups-input-field');
      await driver.tap(cupsInputField);
      await driver.enterText("5");

      final cupsContinueButton = find.byValueKey('cups-continue-button');
      await driver.tap(cupsContinueButton);

      final coffeeText = find.text('63g - course ground coffee');
      final waterText = find.text('887g - water');
    }, skip: true); // Skip this test

    test("should give recommendation for Drip Machine", () async {
      final dripMachineButton = find.byValueKey('drip-machine-button');
      await driver.tap(dripMachineButton);

      final continueButton = find.byValueKey('continue-button');
      await driver.tap(continueButton);

      final cupsInputField = find.byValueKey('cups-input-field');
      await driver.tap(cupsInputField);
      await driver.enterText("5");

      final cupsContinueButton = find.byValueKey('cups-continue-button');
      await driver.tap(cupsContinueButton);

      final coffeeText = find.text('52g - medium ground coffee');
      final waterText = find.text('887g - water');

      expect(await driver.getText(coffeeText), '52g - medium ground coffee');
      expect(await driver.getText(waterText), '887g - water');
    }, skip: true); // Skip this test
  });

  group('Sad Paths', () {
    test("should not advance from Choose Device Screen without a selection",
        () async {
      final continueButton = find.byValueKey('continue-button');
      await driver.tap(continueButton);

      final titleText = find.text('What coffee maker are you using?');
      expect(await driver.getText(titleText), 'What coffee maker are you using?');
    }, skip: true); // Skip this test

    test("should not advance from Choose Cups Screen without cups", () async {
      final frenchPressButton = find.byValueKey('french-press-button');
      await driver.tap(frenchPressButton);

      final continueButton = find.byValueKey('continue-button');
      await driver.tap(continueButton);

      final cupsContinueButton = find.byValueKey('cups-continue-button');
      await driver.tap(cupsContinueButton);

      final cupsTitleText = find.text('How many cups would you like?');
      expect(await driver.getText(cupsTitleText), 'How many cups would you like?');
    }, skip: true); // Skip this test

    test("should not advance from Choose Cups Screen with negative cup amount",
        () async {
      final frenchPressButton = find.byValueKey('french-press-button');
      await driver.tap(frenchPressButton);

      final continueButton = find.byValueKey('continue-button');
      await driver.tap(continueButton);

      final cupsInputField = find.byValueKey('cups-input-field');
      await driver.tap(cupsInputField);
      await driver.enterText("-1");

      final cupsContinueButton = find.byValueKey('cups-continue-button');
      await driver.tap(cupsContinueButton);

      final cupsTitleText = find.text('How many cups would you like?');
      expect(await driver.getText(cupsTitleText), 'How many cups would you like?');
    }, skip: true); // Skip this test

    test("should not advance from Choose Cups Screen with letter for cup amount",
        () async {
      final frenchPressButton = find.byValueKey('french-press-button');
      await driver.tap(frenchPressButton);

      final continueButton = find.byValueKey('continue-button');
      await driver.tap(continueButton);

      final cupsInputField = find.byValueKey('cups-input-field');
      await driver.tap(cupsInputField);
      await driver.enterText("a");

      final cupsContinueButton = find.byValueKey('cups-continue-button');
      await driver.tap(cupsContinueButton);

      final cupsTitleText = find.text('How many cups would you like?');
      expect(await driver.getText(cupsTitleText), 'How many cups would you like?');
    }, skip: true); // Skip this test
  });

  group('Back Button', () {
    test("should return to the previous screen from the Choose Cups Screen",
        () async {
      final frenchPressButton = find.byValueKey('french-press-button');
      await driver.tap(frenchPressButton);

      final continueButton = find.byValueKey('continue-button');
      await driver.tap(continueButton);

      final backButton = find.byTooltip('Back');
      await driver.tap(backButton);

      final titleText = find.text('What coffee maker are you using?');
      expect(await driver.getText(titleText), 'What coffee maker are you using?');
    }, skip: true); // Skip this test
  });
}
