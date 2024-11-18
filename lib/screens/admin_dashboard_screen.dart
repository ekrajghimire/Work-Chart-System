import 'package:flutter/material.dart';
import 'package:work_chart_system/screens/view_all_tasks.dart';
import 'create_task_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreateTaskScreen()), // Navigate to Create Task Screen
                );
              },
              child: Text('Create Task'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ViewAllTasksScreen()), // Navigate to View All Tasks Screen
                );
              },
              child: Text('View All Tasks'),
            ),
          ],
        ),
      ),
    );
  }
}
