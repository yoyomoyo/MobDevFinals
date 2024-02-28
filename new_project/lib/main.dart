import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:new_project/login_page.dart';
import 'package:new_project/home_page.dart';
import 'package:new_project/dashboard_page.dart';
import 'package:new_project/details_page.dart';
import 'package:new_project/settings_page.dart';
import 'package:new_project/signup.dart';
import 'package:new_project/additional_page1.dart';
import 'package:new_project/additional_page2.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobdev Finals',
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
        '/signup': (context) => SignUpPage(), // Route to the SignUpPage
        '/additional_page1': (context) =>
            BMI_Calculator(), // Route to the BMI Calculator widget
        '/additional_page2': (context) =>
            AdditionalPage2(), // Route to the Additional Page 2 widget
      },
    );
  }
}
