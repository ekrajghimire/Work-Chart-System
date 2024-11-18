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
            Text(
              'Welcome, Admin!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create_task');
              },
              child: Text('Create Task'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/view_tasks');
              },
              child: Text('View All Tasks'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/reports');
              },
              child: Text('Generate Reports'),
            ),
          ],
        ),
      ),
    );
  }
}
