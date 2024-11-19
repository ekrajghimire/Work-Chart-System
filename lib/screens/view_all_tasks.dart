import 'package:flutter/material.dart';

class ViewAllTasksScreen extends StatefulWidget {
  const ViewAllTasksScreen({Key? key, required this.tasks, required bool isAdmin}) : super(key: key);

  final List<Map<String, dynamic>> tasks;

  @override
  _ViewAllTasksScreenState createState() => _ViewAllTasksScreenState();
}

class _ViewAllTasksScreenState extends State<ViewAllTasksScreen> {
  void _updateTaskStatus(int index, String newStatus) {
    setState(() {
      widget.tasks[index]['status'] = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> toDoTasks =
        widget.tasks.where((task) => task['status'] == 'To-Do').toList();
    List<Map<String, dynamic>> inProgressTasks =
        widget.tasks.where((task) => task['status'] == 'In Progress').toList();
    List<Map<String, dynamic>> completedTasks =
        widget.tasks.where((task) => task['status'] == 'Completed').toList();

    return Scaffold(
      appBar: AppBar(title: const Text('View All Tasks')),
      body: ListView(
        children: [
          _buildTaskSection('To-Do', toDoTasks, 'In Progress'),
          _buildTaskSection('In Progress', inProgressTasks, 'Completed'),
          _buildTaskSection('Completed', completedTasks, null),
        ],
      ),
    );
  }

  Widget _buildTaskSection(
      String title, List<Map<String, dynamic>> tasks, String? nextStatus) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          tasks.isEmpty
              ? const Text('No tasks available.')
              : Column(
                  children: tasks.map((task) {
                    int index = widget.tasks.indexOf(task);
                    return Card(
                      child: ListTile(
                        title: Text(task['taskName'] ?? 'Unnamed Task'),
                        subtitle:
                            Text('Assigned to: ${task['crewMember'] ?? 'N/A'}'),
                        trailing: nextStatus != null
                            ? IconButton(
                                icon: const Icon(Icons.arrow_forward),
                                onPressed: () =>
                                    _updateTaskStatus(index, nextStatus),
                              )
                            : null,
                      ),
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}
