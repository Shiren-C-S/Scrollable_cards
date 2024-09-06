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
    {"month": "MARCH", "amount": "-\$3,250", "description": "Spent until now in March 2024", "color": "0xFF1E88E5"},
    {"month": "FEB", "amount": "-\$2,100", "description": "Spent until now in February 2024", "color": "0xFF00E5FF"},
    {"month": "JAN", "amount": "-\$1,850", "description": "Spent until now in January 2024", "color": "0xFFFFC107"},
    {"month": "DEC", "amount": "-\$4,200", "description": "Spent until now in December 2023", "color": "0xFFFF5722"},
    {"month": "NOV", "amount": "-\$3,000", "description": "Spent until now in November 2023", "color": "0xFF8E24AA"},
    {"month": "OCT", "amount": "-\$2,500", "description": "Spent until now in October 2023", "color": "0xFF00C853"},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 250, // Fixed height for the cards
        child: PageView.builder(
          itemCount: monthData.length,
          controller: PageController(viewportFraction: 0.6), // Adjusted for overlap (50% visible)
          itemBuilder: (context, index) {
            final cardData = monthData[index];
            return Transform.translate(
              offset: Offset(-50.0 * index, 0), // 50px overlap, adjust based on how much overlap you want
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  children: [
                    Positioned(
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        color: Color(int.parse(cardData['color']!)),
                        elevation: 5,
                        child: Container(
                          width: 250, // Adjusted width for the cards to fit the overlap
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
              ),
            );
          },
        ),
      ),
    );
  }
}
