import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BMI_Calculator(),
  ));
}

// Define BMIReport class to represent a BMI calculation report
class BMIReport {
  final double bmi;
  final String date;

  BMIReport(this.bmi, this.date);
}

class BMI_Calculator extends StatefulWidget {
  @override
  _BMI_CalculatorState createState() => _BMI_CalculatorState();
}

class _BMI_CalculatorState extends State<BMI_Calculator> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0;
  List<BMIReport> _bmiReports = []; // Maintain a list of BMI reports

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
                // Calculate BMI when the button is pressed
                calculateBMI();
                // Navigate to BMIReportsPage after calculating BMI
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BMIReportsPage(bmiReports: _bmiReports),
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
        currentIndex: 1,
        onTap: (index) {
          // Handle navigation
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BMIReportsPage(bmiReports: _bmiReports),
                ),
              );
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
    double heightInMeters = heightInCM / 100.0;
    double weight = double.tryParse(_weightController.text) ?? 0.0;

    if (heightInCM > 0 && weight > 0) {
      double bmi = weight / (heightInMeters * heightInMeters);
      setState(() {
        _bmiResult = bmi;
        // Add the BMI report to the list
        _bmiReports.add(BMIReport(bmi, DateTime.now().toString()));
      });
    } else {
      setState(() {
        _bmiResult = 0.0;
      });
    }
  }
}

class BMIReportsPage extends StatefulWidget {
  final List<BMIReport> bmiReports;

  BMIReportsPage({required this.bmiReports});

  @override
  _BMIReportsPageState createState() => _BMIReportsPageState();
}

class _BMIReportsPageState extends State<BMIReportsPage> {
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Reports'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                // Toggle editing mode
                _isEditing = !_isEditing;
              });
            },
            icon: Icon(_isEditing ? Icons.done : Icons.edit),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.bmiReports.length,
        itemBuilder: (context, index) {
          final report = widget.bmiReports[index];
          return ListTile(
            title: Text(
              'BMI: ${report.bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0),
            ),
            subtitle: Text(
              'Date: ${report.date}',
              style: TextStyle(fontSize: 16.0),
            ),
            trailing: _isEditing
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        // Delete the report
                        widget.bmiReports.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete),
                  )
                : null,
          );
        },
      ),
    );
  }
}
