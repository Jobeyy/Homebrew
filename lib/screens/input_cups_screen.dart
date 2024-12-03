import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for input formatters
import 'package:homebrew/screens/recommended_cups_screen.dart';
import 'package:homebrew/utils/coffee_tools.dart';

class InputCupsScreen extends StatefulWidget {
  final String device;
  const InputCupsScreen({Key? key, required this.device}) : super(key: key);

  @override
  State<InputCupsScreen> createState() => _InputCupsScreenState();
}

class _InputCupsScreenState extends State<InputCupsScreen> {
  bool _isButtonEnabled = false;
  final _controller = TextEditingController();

  int getCups() {
    if (_controller.text.isEmpty) {
      throw FormatException('Input cannot be empty.');
    }

    try {
      return int.parse(_controller.text); // Convert valid numeric strings to an integer
    } catch (e) {
      throw FormatException('Invalid input. Please enter a valid number.');
    }
  }

  double getGrams() {
    return CoffeeTools.ouncesToGrams(CoffeeTools.cupsToOunces(getCups()));
  }

  double getWater() {
    return getGrams();
  }

  double getCoffee() {
    if (widget.device == "french-press") {
      return CoffeeTools.frenchPressCoffee(getGrams());
    } else {
      return CoffeeTools.dripMachineCoffee(getGrams());
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_updateButtonState);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff4C748B)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "How many cups would you like?",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0xff4C748B),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 330,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Color(0xff4C748B)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly, // Allow digits only
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none, // Remove the default border
                          hintText: 'Enter number of cups',
                          hintStyle: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff4C748B),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isButtonEnabled
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecommendedCupsScreen(
                                  coffee: getCoffee(),
                                  water: getWater(),
                                ),
                              ),
                            );
                          }
                        : null, // Disable the button when input is empty
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(280, 46), // Set width and height
                      backgroundColor: _isButtonEnabled
                          ? Color(0xff4C748B)
                          : Color(0xffE2E2E2), // Gray color when disabled
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded edges
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: _isButtonEnabled
                            ? Color(0xffFFFFFF)
                            : Color(0xff757474),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
 