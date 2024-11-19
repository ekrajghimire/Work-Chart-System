import 'package:flutter/material.dart';
import 'create_task_screen.dart';
import 'view_all_tasks.dart';
import 'manage_crew_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({
    Key? key,
    required this.tasks,
    required this.crewMembers,
  }) : super(key: key);

  final List<Map<String, dynamic>> tasks; // List of tasks
  final List<Map<String, String>> crewMembers; // Updated type for crew members

  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateTaskScreen(
                      tasks: widget.tasks,
                      crewMembers: widget.crewMembers
                          .map((member) => member['name'] ?? '')
                          .toList(),
                      isAdmin: true,
                    ),
                  ),
                ).then((_) => setState(() {}));
              },
              child: const Text('Create Task'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewAllTasksScreen(
                      tasks: widget.tasks,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageCrewScreen(
                      crewMembers: widget.crewMembers,
                    ),
                  ),
                ).then((_) => setState(() {}));
              },
              child: const Text('Manage Crew Members'),
            ),
          ],
        ),
      ),
    );
  }
}
