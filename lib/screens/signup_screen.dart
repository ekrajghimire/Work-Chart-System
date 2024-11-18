import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sign-up logic (store locally or show a message)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sign-up successful')),
                );
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
