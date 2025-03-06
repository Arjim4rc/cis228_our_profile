import 'package:flutter/material.dart';

class ProfileOwie extends StatefulWidget {
  const ProfileOwie({super.key});

  @override
  State<ProfileOwie> createState() => _ProfileOwieState();
}

class _ProfileOwieState extends State<ProfileOwie> {
  final TextEditingController profilename = TextEditingController();
  final TextEditingController profileemail = TextEditingController();

  final Map<String, bool> _interests = {
    "Music": false,
    "Echo Farming": false,
    "Nuking Bosses": false,
    "Traveling": false,
    "Driving": false,
    "Feeding Jue": false,
    "Loving Rover": false,
    "Playing checkers": false,
  };

  void _submitData() {
    String name = profilename.text.trim();
    String email = profileemail.text.trim();
    List<String> selectedInterests = _interests.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    print("\n==============  YOUR PROFILE  ==============");
    print("📌 Name: $name");
    print("📌 Email: $email");
    print("📌 Selected Interests: ${selectedInterests.isNotEmpty ? selectedInterests.join(', ') : 'None'}");
    print("=================================================");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Owie's Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/owie.jpg')),
            const SizedBox(height: 20),
            const Text("Description:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("RJ Marc Daligdig is a 3rd Year student taking up CIS 228."),
            const SizedBox(height: 20),
            TextField(controller: profilename, decoration: const InputDecoration(labelText: 'Enter your name')),
            TextField(controller: profileemail, decoration: const InputDecoration(labelText: 'Enter your email')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _submitData, child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}