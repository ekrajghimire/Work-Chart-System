import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
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
                // Navigate to Create Task Screen
                Navigator.pushNamed(context, '/create_task');
              },
              child: Text('Create New Task'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to View All Tasks Screen
                Navigator.pushNamed(context, '/view_all_tasks');
              },
              child: Text('View All Tasks'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Placeholder for View Reports
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('View Reports feature coming soon!')),
                );
              },
              child: Text('View Reports'),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Welcome, Admin!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
