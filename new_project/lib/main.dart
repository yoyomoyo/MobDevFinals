import 'package:flutter/material.dart';
import 'package:new_project/login_page.dart';
import 'package:new_project/home_page.dart';
import 'package:new_project/dashboard_page.dart';
import 'package:new_project/details_page.dart';
import 'package:new_project/settings_page.dart';
import 'package:new_project/additional_page1.dart';
import 'package:new_project/additional_page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/dashboard': (context) => DashboardPage(),
        '/details': (context) => DetailsPage(),
        '/settings': (context) => SettingsPage(),
        '/additional_page1': (context) =>
            BMI_Calculator(), // Route to the BMI Calculator widget
        '/additional_page2': (context) =>
            AdditionalPage2(), // Route to the Additional Page 2 widget
      },
    );
  }
}
