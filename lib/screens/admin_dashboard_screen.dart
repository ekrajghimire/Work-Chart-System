import 'package:flutter/material.dart';
import 'create_task_screen.dart';
import 'view_all_tasks.dart';
import 'manage_crew_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tasks; // This will store the tasks

  // Constructor to receive tasks from the parent widget
  const AdminDashboardScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the CreateTaskScreen, passing the tasks list
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateTaskScreen(
                      tasks: tasks, // Passing tasks to CreateTaskScreen
                      isAdmin: true,
                    ),
                  ),
                );
              },
              child: const Text('Create Task'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the ViewAllTasksScreen, passing the tasks list
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewAllTasksScreen(
                      tasks: tasks, // Passing tasks to ViewAllTasksScreen
                      isAdmin: true,
                    ),
                  ),
                );
              },
              child: const Text('View All Tasks'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the ManageCrewScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManageCrewScreen(),
                  ),
                );
              },
              child: const Text('Manage Crew Members'),
            ),
          ],
        ),
      ),
    );
  }
}
