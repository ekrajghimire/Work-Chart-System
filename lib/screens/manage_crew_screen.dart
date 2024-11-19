import 'package:flutter/material.dart';

class ManageCrewScreen extends StatefulWidget {
  final List<Map<String, String>> crewMembers;

  const ManageCrewScreen({Key? key, required this.crewMembers})
      : super(key: key);

  @override
  State<ManageCrewScreen> createState() => _ManageCrewScreenState();
}

class _ManageCrewScreenState extends State<ManageCrewScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _crewName;
  String? _phoneNumber;
  String? _email;

  void _addOrEditCrewMember({Map<String, String>? existingCrewMember}) {
    if (existingCrewMember != null) {
      _crewName = existingCrewMember['name'];
      _phoneNumber = existingCrewMember['phone'];
      _email = existingCrewMember['email'];
    } else {
      _crewName = null;
      _phoneNumber = null;
      _email = null;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(existingCrewMember == null
            ? 'Add Crew Member'
            : 'Edit Crew Member'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: _crewName,
                decoration: const InputDecoration(labelText: 'Crew Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the crew name';
                  }
                  return null;
                },
                onSaved: (value) => _crewName = value,
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: _phoneNumber,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the phone number';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
                onSaved: (value) => _phoneNumber = value,
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                setState(() {
                  if (existingCrewMember != null) {
                    // Edit crew member
                    existingCrewMember['name'] = _crewName!;
                    existingCrewMember['phone'] = _phoneNumber!;
                    existingCrewMember['email'] = _email!;
                  } else {
                    // Add new crew member
                    widget.crewMembers.add({
                      'name': _crewName!,
                      'phone': _phoneNumber!,
                      'email': _email!,
                    });
                  }
                });
                Navigator.pop(context);
              }
            },
            child: Text(existingCrewMember == null ? 'Add' : 'Save'),
          ),
        ],
      ),
    );
  }

  void _deleteCrewMember(Map<String, String> crewMember) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Crew Member'),
        content:
            const Text('Are you sure you want to delete this crew member?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                widget.crewMembers.remove(crewMember);
              });
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Crew Members'),
      ),
      body: widget.crewMembers.isEmpty
          ? const Center(
              child: Text(
                'No crew members added. Tap the "+" button to add.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: widget.crewMembers.length,
                itemBuilder: (context, index) {
                  final crewMember = widget.crewMembers[index];
                  return Card(
                    child: ListTile(
                      title: Text(crewMember['name'] ?? ''),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Phone: ${crewMember['phone']}'),
                          Text('Email: ${crewMember['email']}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _addOrEditCrewMember(
                                existingCrewMember: crewMember),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteCrewMember(crewMember),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditCrewMember(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
