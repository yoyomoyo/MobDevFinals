import 'package:flutter/material.dart';
import 'package:new_project/additional_page1.dart';

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
        leading: _isEditing
            ? IconButton(
                onPressed: () {
                  setState(() {
                    // Toggle editing mode
                    _isEditing = !_isEditing;
                  });
                },
                icon: Icon(Icons.close),
              )
            : null,
        actions: [
          if (!_isEditing)
            IconButton(
              onPressed: () {
                setState(() {
                  // Toggle editing mode
                  _isEditing = !_isEditing;
                });
              },
              icon: Icon(Icons.edit),
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
            onTap: () {
              if (_isEditing) {
                setState(() {
                  // Delete the report
                  widget.bmiReports.removeAt(index);
                });
              }
            },
          );
        },
      ),
    );
  }
}
