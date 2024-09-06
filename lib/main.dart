import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: SwipeableCards(),
        ),
      ),
    );
  }
}

class SwipeableCards extends StatelessWidget {
  final List<Map<String, String>> monthData = [
    {"month": "MARCH", "amount": "-\$3,250", "description": "Spent until March 2024", "color": "0xFF1E88E5"},
    {"month": "FEB", "amount": "-\$2,100", "description": "Spent until February 2024", "color": "0xFF00E5FF"},
    {"month": "JAN", "amount": "-\$1,850", "description": "Spent until January 2024", "color": "0xFFFFC107"},
    {"month": "DEC", "amount": "-\$4,200", "description": "Spent until December 2023", "color": "0xFFFF5722"},
    {"month": "NOV", "amount": "-\$3,000", "description": "Spent until November 2023", "color": "0xFF8E24AA"},
    {"month": "OCT", "amount": "-\$2,500", "description": "Spent until October 2023", "color": "0xFF00C853"},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 250, 
        child: PageView.builder(
          itemCount: monthData.length,
          controller: PageController(viewportFraction: 0.6), 
          itemBuilder: (context, index) {
            final cardData = monthData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                clipBehavior: Clip.none, 
                children: [
                  if (index < monthData.length - 1)
                    Positioned(
                      left: 50.0, 
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Color(int.parse(monthData[index + 1]['color']!)),
                        elevation: 5,
                        child: Container(
                          width: 250, 
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  monthData[index + 1]['description']!,
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  monthData[index + 1]['amount']!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  monthData[index + 1]['month']!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    left: 10, 
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      color: Color(int.parse(cardData['color']!)),
                      elevation: 5,
                      child: Container(
                        width: 300, 
                        height: 200, 
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cardData['description']!,
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(height: 20),
                              Text(
                                cardData['amount']!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              Text(
                                cardData['month']!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
