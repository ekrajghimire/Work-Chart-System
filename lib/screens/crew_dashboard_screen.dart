import 'package:flutter/material.dart';

class CrewDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crew Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome, Crew Member!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/view_tasks');
              },
              child: Text('View Assigned Tasks'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/update_status');
              },
              child: Text('Update Task Status'),
            ),
          ],
        ),
      ),
    );
  }
}
