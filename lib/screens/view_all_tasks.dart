import 'package:flutter/material.dart';

class ViewAllTasksScreen extends StatelessWidget {
  // Sample data for tasks
  final List<Map<String, String>> tasks = [
    {'task': 'Task 1', 'status': 'To Do', 'assignedTo': 'John'},
    {'task': 'Task 2', 'status': 'In Progress', 'assignedTo': 'Jane'},
    {'task': 'Task 3', 'status': 'Done', 'assignedTo': 'Mike'},
    // Add more tasks here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Tasks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(bottom: 10),
              child: ListTile(
                title: Text(tasks[index]['task']!),
                subtitle: Text('Assigned to: ${tasks[index]['assignedTo']}'),
                trailing: Chip(
                  label: Text(tasks[index]['status']!),
                  backgroundColor: tasks[index]['status'] == 'Done'
                      ? Colors.green
                      : tasks[index]['status'] == 'In Progress'
                          ? Colors.orange
                          : Colors.red,
                ),
                onTap: () {
                  // On tap, you could add functionality to view task details
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Viewing details for ${tasks[index]['task']}')),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
