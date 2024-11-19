import 'package:flutter/material.dart';

class ManageCrewScreen extends StatefulWidget {
  const ManageCrewScreen({Key? key}) : super(key: key);

  @override
  _ManageCrewScreenState createState() => _ManageCrewScreenState();
}

class _ManageCrewScreenState extends State<ManageCrewScreen> {
  final List<Map<String, String>> _crewMembers = [
    {'name': 'John Doe', 'phone': '9876543210', 'email': 'john@example.com'},
    {'name': 'Jane Smith', 'phone': '9123456789', 'email': 'jane@example.com'},
  ];

  void _addOrEditCrewMember({Map<String, String>? existingMember, int? index}) {
    TextEditingController _nameController = TextEditingController(
        text: existingMember != null ? existingMember['name'] : '');
    TextEditingController _phoneController = TextEditingController(
        text: existingMember != null ? existingMember['phone'] : '');
    TextEditingController _emailController = TextEditingController(
        text: existingMember != null ? existingMember['email'] : '');

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
              existingMember == null ? 'Add Crew Member' : 'Edit Crew Member'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration:
                    const InputDecoration(hintText: 'Enter crew member name'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _phoneController,
                decoration:
                    const InputDecoration(hintText: 'Enter phone number'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration:
                    const InputDecoration(hintText: 'Enter email address'),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _phoneController.text.isNotEmpty &&
                    _emailController.text.isNotEmpty) {
                  setState(() {
                    if (existingMember == null) {
                      _crewMembers.add({
                        'name': _nameController.text,
                        'phone': _phoneController.text,
                        'email': _emailController.text,
                      });
                    } else if (index != null) {
                      _crewMembers[index] = {
                        'name': _nameController.text,
                        'phone': _phoneController.text,
                        'email': _emailController.text,
                      };
                    }
                  });
                  Navigator.of(dialogContext).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(existingMember == null
                          ? 'Crew member added'
                          : 'Crew member updated'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('All fields are required')),
                  );
                }
              },
              child: Text(existingMember == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }

  void _deleteCrewMember(int index) {
    setState(() {
      _crewMembers.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Crew member deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Crew Members'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => _addOrEditCrewMember(),
              child: const Text('Add New Crew Member'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _crewMembers.length,
                itemBuilder: (context, index) {
                  final crewMember = _crewMembers[index];
                  return Card(
                    child: ListTile(
                      title: Text(crewMember['name'] ?? ''),
                      subtitle: Text(
                          'Phone: ${crewMember['phone']}\nEmail: ${crewMember['email']}'),
                      isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _addOrEditCrewMember(
                                existingMember: crewMember, index: index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteCrewMember(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
