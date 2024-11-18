import 'package:flutter/material.dart';
import 'package:work_chart_system/screens/admin_dashboard_screen.dart';
import 'package:work_chart_system/screens/crew_dashboard_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Work Chart System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/admin_dashboard': (context) => AdminDashboard(),
        '/crew_dashboard': (context) => CrewDashboard(),
      },
    );
  }
}
