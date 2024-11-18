import 'package:flutter/material.dart';
import 'screens/admin_dashboard_screen.dart'; // Ensure this is the correct import
import 'screens/crew_dashboard_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/create_task_screen.dart'; // Assuming the task screen was renamed to match this
import 'screens/view_all_tasks.dart'; // Assuming this screen was added

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PlaceholderHomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/admin_dashboard': (context) => AdminDashboard(),
        '/crew_dashboard': (context) => CrewDashboard(),
        '/create_task': (context) => CreateTaskScreen(),
        '/view_all_tasks': (context) => ViewAllTasksScreen(),
      },
    );
  }
}

class PlaceholderHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Chart System'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Work Chart System',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Go to Login'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Go to Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
