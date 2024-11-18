import 'package:flutter/material.dart';

class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String taskName = '';
  String taskDescription = '';
  String taskDate = '';
  String assignedTo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Task Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    taskName = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Task Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task description';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    taskDescription = value;
                  });
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Task Date (yyyy-mm-dd)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task date';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    taskDate = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Assigned To'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the assignee';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    assignedTo = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // If form is valid, submit the task data
                      // You can add logic here to save the task data to a local storage or backend
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Task Created Successfully!'),
                      ));
                      Navigator.pop(context); // Go back to the admin dashboard
                    }
                  },
                  child: Text('Create Task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
