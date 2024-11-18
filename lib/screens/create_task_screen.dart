import 'package:flutter/material.dart';

class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String _taskName = '';
  String _client = '';
  String _location = '';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _submitTask() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // You can replace this with logic to save the task (e.g., save to local database).
      print('Task Created: $_taskName, Client: $_client, Location: $_location');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Task Created Successfully')),
      );
      Navigator.pop(context);
    }
  }

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
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Task Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task name';
                  }
                  return null;
                },
                onSaved: (value) => _taskName = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Client Name'),
                onSaved: (value) => _client = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                onSaved: (value) => _location = value!,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Date: ${_selectedDate.toLocal()}'.split(' ')[0],
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: _pickDate,
                    child: Text('Select Date'),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Time: ${_selectedTime.format(context)}',
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: _pickTime,
                    child: Text('Select Time'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitTask,
                child: Text('Create Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
