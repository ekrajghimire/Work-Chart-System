import 'package:flutter/material.dart';

class ViewAllTasksScreen extends StatelessWidget {
  final List<Map<String, String>> tasks = [
    {
      'name': 'Task 1',
      'description': 'Task description 1',
      'date': '2024-11-19',
      'assigned': 'John Doe'
    },
    {
      'name': 'Task 2',
      'description': 'Task description 2',
      'date': '2024-11-20',
      'assigned': 'Jane Smith'
    },
    {
      'name': 'Task 3',
      'description': 'Task description 3',
      'date': '2024-11-21',
      'assigned': 'Mark Lee'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Tasks'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              title: Text(task['name'] ?? ''),
              subtitle: Text(
                  'Assigned to: ${task['assigned']}\nDate: ${task['date']}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Add logic for deleting a task here
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Task deleted!'),
                  ));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
