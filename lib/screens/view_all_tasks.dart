import 'package:flutter/material.dart';

class ViewAllTasksScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;

  const ViewAllTasksScreen({Key? key, required this.tasks, required bool isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View All Tasks'),
      ),
      body: tasks.isEmpty
          ? const Center(child: Text('No tasks available.'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(task['taskName'] ?? 'No Task Name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Client: ${task['clientName'] ?? 'N/A'}'),
                        Text('Location: ${task['location'] ?? 'N/A'}'),
                        Text('Date: ${task['date'] ?? 'N/A'}'),
                        Text('Time: ${task['time'] ?? 'N/A'}'),
                        Text('Crew Member: ${task['crewMember'] ?? 'N/A'}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
