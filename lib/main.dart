import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:work_chart_system/screens/manage_crew_screen.dart';
import 'package:work_chart_system/screens/view_all_tasks.dart';
import 'dart:io' show Platform;

import 'screens/admin_dashboard_screen.dart';
import 'screens/crew_dashboard_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/create_task_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize database for desktop or web
  if (kIsWeb || isDesktop) {
    databaseFactory = databaseFactoryFfi;
  }

  runApp(MyApp());
}

/// Check if the app is running on a desktop platform
bool get isDesktop =>
    !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);

class MyApp extends StatelessWidget {
  // Shared task list and crew members list
  final List<Map<String, dynamic>> tasks = [];
  final List<Map<String, String>> crewMembers = [];

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
        '/admin_dashboard': (context) =>
            AdminDashboardScreen(tasks: tasks, crewMembers: crewMembers),
        '/manage_crew': (context) => ManageCrewScreen(crewMembers: crewMembers),
        '/crew_dashboard': (context) => CrewDashboard(),
        '/create_task': (context) => CreateTaskScreen(
              tasks: tasks,
              crewMembers:
                  crewMembers.map((member) => member['name'] ?? '').toList(),
              isAdmin: true,
            ),
        '/view_all_tasks': (context) => ViewAllTasksScreen(
              tasks: tasks,
              isAdmin: true,
            ),
      },
    );
  }
}

class PlaceholderHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Chart System'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Work Chart System',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Go to Login'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Go to Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
