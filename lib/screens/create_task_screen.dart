import 'package:flutter/material.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({
    Key? key,
    required this.tasks,
    required this.crewMembers,
    required bool isAdmin,
  }) : super(key: key);

  final List<Map<String, dynamic>> tasks;
  final List<String> crewMembers;

  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _clientNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedCrewMember;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _createTask() {
    if (_taskNameController.text.isEmpty ||
        _clientNameController.text.isEmpty ||
        _locationController.text.isEmpty ||
        _selectedDate == null ||
        _selectedTime == null ||
        _selectedCrewMember == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all the fields')),
      );
      return;
    }

    widget.tasks.add({
      'taskName': _taskNameController.text.trim(),
      'clientName': _clientNameController.text.trim(),
      'location': _locationController.text.trim(),
      'date':
          '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
      'time':
          '${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}',
      'crewMember': _selectedCrewMember,
      'status': 'To-Do',
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _taskNameController,
              decoration: const InputDecoration(labelText: 'Task Name'),
            ),
            TextField(
              controller: _clientNameController,
              decoration: const InputDecoration(labelText: 'Client Name'),
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      _selectedDate == null
                          ? 'Select Date'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text(
                      _selectedTime == null
                          ? 'Select Time'
                          : '${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}',
                    ),
                  ),
                ),
              ],
            ),
            DropdownButtonFormField<String>(
              value: _selectedCrewMember,
              decoration:
                  const InputDecoration(labelText: 'Assign Crew Member'),
              items: widget.crewMembers
                  .map((member) =>
                      DropdownMenuItem(value: member, child: Text(member)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCrewMember = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createTask,
              child: const Text('Create Task'),
            ),
          ],
        ),
      ),
    );
  }
}
