import 'package:flutter/material.dart';

class RecommendedCupsScreen extends StatefulWidget {
  final double water;
  final double coffee;

  RecommendedCupsScreen({Key? key, required this.water, required this.coffee})
      : super(key: key);

  @override
  State<RecommendedCupsScreen> createState() => _RecommendedCupsScreenState();
}

class _RecommendedCupsScreenState extends State<RecommendedCupsScreen> {
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
        children: [
          Expanded(
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Color(0xff4C748B)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Recommended',
                      style: TextStyle(
                        fontFamily: "Kollektif",
                        fontSize: 18,
                        color: Color(0xff4C748B),
                      ),
                    ),
                    SizedBox(height: 8), // Space between title and line
                    Divider(
                      color: Color(0xff4C748B),
                      thickness: 1.0,
                    ),
                    SizedBox(height: 8), // Space between line and content
                    Text(
                      '${widget.coffee.toStringAsFixed(2)}g - course ground coffee',
                      style: TextStyle(
                        fontFamily: "Kollektif",
                        fontSize: 14,
                        color: Color(0xff4C748B),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${widget.water.toStringAsFixed(2)}g - water',
                      style: TextStyle(
                        fontFamily: "Kollektif",
                        fontSize: 14,
                        color: Color(0xff4C748B),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Enjoy your delicious coffee.',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        color: Color(0xff4C748B),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(280, 46), // Match width and height
                backgroundColor: Color(0xff4C748B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ), 
              child: Text(
                'Done',
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
