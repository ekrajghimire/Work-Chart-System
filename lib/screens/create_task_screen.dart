import 'package:flutter/material.dart';

class CreateTaskScreen extends StatefulWidget {
  final List<Map<String, dynamic>> tasks;

  const CreateTaskScreen({Key? key, required this.tasks, required bool isAdmin}) : super(key: key);

  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _clientNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedCrewMember;

  final List<String> _crewMembers = ['Member 1', 'Member 2', 'Member 3']; // Example crew members.

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
    String taskName = _taskNameController.text.trim();
    String clientName = _clientNameController.text.trim();
    String location = _locationController.text.trim();
    String amount = _amountController.text.trim();

    if (taskName.isEmpty ||
        clientName.isEmpty ||
        location.isEmpty ||
        _selectedDate == null ||
        _selectedTime == null ||
        (_selectedCrewMember == null || _selectedCrewMember!.isEmpty)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please fill in all required fields.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    // Add task to the shared list.
    widget.tasks.add({
      'taskName': taskName,
      'clientName': clientName,
      'location': location,
      'date': '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
      'time': '${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}',
      'crewMember': _selectedCrewMember,
      'amount': amount,
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Task Created'),
        content: const Text('The task has been successfully created.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );

    // Clear form after creating the task.
    _taskNameController.clear();
    _clientNameController.clear();
    _locationController.clear();
    _amountController.clear();
    setState(() {
      _selectedDate = null;
      _selectedTime = null;
      _selectedCrewMember = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _taskNameController,
                decoration: const InputDecoration(labelText: 'Task Name'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _clientNameController,
                decoration: const InputDecoration(labelText: 'Client Name'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCrewMember,
                hint: const Text('Assign Crew Member'),
                items: _crewMembers.map((String member) {
                  return DropdownMenuItem<String>(
                    value: member,
                    child: Text(member),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedCrewMember = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Amount (Admin Only)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _createTask,
                child: const Text('Create Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
