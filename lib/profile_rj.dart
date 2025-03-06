import 'package:flutter/material.dart';

class ProfileRJ extends StatefulWidget {
  const ProfileRJ({super.key});

  @override
  _ProfileRJState createState() => _ProfileRJState();
}

class _ProfileRJState extends State<ProfileRJ> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final Map<String, bool> _interests = {
    "Gaming": false,
    "Traveling": false,
    "Cooking": false,
  };

  void _submitForm() {
    final name = _nameController.text;
    final email = _emailController.text;
    final selectedInterests =
        _interests.entries
            .where((entry) => entry.value)
            .map((entry) => entry.key)
            .toList();

    print("Name: $name");
    print("Email: $email");
    print("Interests: $selectedInterests");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RJ's Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/UR.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "RJ Marc Daligdig is a 3rd Year student taking up CIS 228.",
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Enter your name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Enter your email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  _interests.keys.map((String key) {
                    return CheckboxListTile(
                      title: Text(key),
                      value: _interests[key],
                      onChanged: (bool? value) {
                        setState(() {
                          _interests[key] = value ?? false;
                        });
                      },
                    );
                  }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _submitForm, child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
