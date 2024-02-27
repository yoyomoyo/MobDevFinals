import 'package:flutter/material.dart';
import 'package:new_project/additional_page2.dart';

class BMI_Calculator extends StatefulWidget {
  @override
  _BMI_CalculatorState createState() => _BMI_CalculatorState();
}

class _BMI_CalculatorState extends State<BMI_Calculator> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Height (in cm)'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight (in kilograms)'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Calculate BMI
                calculateBMI();

                // Navigate to AdditionalPage2 and pass BMIReport object
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdditionalPage2(
                      bmiReport:
                          BMIReport(_bmiResult, DateTime.now().toString()),
                    ),
                  ),
                );
              },
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20.0),
            Text(
              'BMI Result: ${_bmiResult.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Set the current index of the bottom navigation bar
        onTap: (index) {
          // Handle navigation
          switch (index) {
            case 0:
              // Handle home navigation
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              // Do nothing as we are already on the calculator page
              break;
            case 2:
              // Handle profile navigation
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

  void calculateBMI() {
    double heightInCM = double.tryParse(_heightController.text) ?? 0.0;
    double heightInMeters =
        heightInCM / 100.0; // Convert height from cm to meters
    double weight = double.tryParse(_weightController.text) ?? 0.0;

    if (heightInCM > 0 && weight > 0) {
      double bmi = weight / (heightInMeters * heightInMeters);
      setState(() {
        _bmiResult = bmi;
      });
    } else {
      setState(() {
        _bmiResult = 0.0;
      });
    }
  }
}
