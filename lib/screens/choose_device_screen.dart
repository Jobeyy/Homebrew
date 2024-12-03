import 'package:flutter/material.dart';
import 'package:homebrew/screens/input_cups_screen.dart';

class ChooseDeviceScreen extends StatefulWidget {
  const ChooseDeviceScreen({super.key});

  @override
  State<ChooseDeviceScreen> createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  String _device = "";

  void _selectDevice(String dev) {
    setState(() {
      _device = dev; // Set the selected device
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "What coffee maker are you using?",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0xff4C748B),
                    ),
                  ),
                  Container(
                    width: 330,
                    child: OutlinedButton(
                      onPressed: () {
                        _selectDevice("french-press");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "French Press",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xff4C748B),
                            ),
                          ),
                          if (_device == "french-press") // Show checkbox if selected
                            Icon(
                              Icons.check,
                              color: Color(0xff4C748B),
                            ),
                        ],
                      ),
                      key: const Key('french-press-button'),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 2.0, color: Color(0xff4C748B)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 330,
                    child: OutlinedButton(
                      onPressed: () {
                        _selectDevice("drip-machine");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Drip Machine",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xff4C748B),
                            ),
                          ),
                          if (_device == "drip-machine") // Show checkbox if selected
                            Icon(
                              Icons.check,
                              color: Color(0xff4C748B),
                            ),
                        ],
                      ),
                      key: const Key('drip-machine-button'),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 2.0, color: Color(0xff4C748B)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _device.isNotEmpty
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InputCupsScreen(device: _device),
                              ),
                            );
                          }
                        : null, // Disable the button when _device is empty
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(280, 46), // Set width and height
                      backgroundColor: _device.isNotEmpty
                          ? Color(0xff4C748B) // Enabled color
                          : Color(0xffE2E2E2), // Disabled color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded edges
                      ),
                    ),
                    child: Text(
                      'Continue',
                      key: const Key('continue-button'),
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: _device.isNotEmpty
                            ? Color(0xffFFFFFF) // Text color when enabled
                            : Color(0xff757474), // Text color when disabled
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
