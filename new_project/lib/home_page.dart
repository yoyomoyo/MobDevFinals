import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is BMI?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'BMI stands for Body Mass Index. It is a measure of body fat based on height and weight that applies to adult men and women.',
            ),
            SizedBox(height: 20.0),
            Text(
              'How is BMI calculated?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'BMI is calculated by dividing a person\'s weight in kilograms by the square of their height in meters (BMI = weight(kg) / height(m)^2).',
            ),
            SizedBox(height: 20.0),
            Text(
              'What do BMI ranges mean?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'BMI ranges are categorized as follows:\n\nUnderweight: BMI less than 18.5\nNormal weight: BMI 18.5–24.9\nOverweight: BMI 25–29.9\nObesity: BMI 30 or more',
            ),
            SizedBox(height: 20.0),
            Text(
              'Disclaimer:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Please note that BMI is a general indicator of health and should not be considered as the sole basis for medical decisions. Consult a healthcare professional for personalized advice.',
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                  Navigator.pushReplacementNamed(context, '/additional_page1');
                },
                child: Text("LET'S CALCULATE"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              // Navigate to the home page
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              // Navigate to the calculator page
              Navigator.pushReplacementNamed(context, '/additional_page1');
              break;
            case 2:
              // Navigate to the profile page
              Navigator.pushReplacementNamed(context, '/additional_page2');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
