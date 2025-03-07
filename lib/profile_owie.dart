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
    List<String> selectedInterests =
        _interests.entries
            .where((entry) => entry.value)
            .map((entry) => entry.key)
            .toList();

    print("\n==============  YOUR PROFILE  ==============");
    print("📌 Name: $name");
    print("📌 Email: $email");
    print(
      "📌 Selected Interests: ${selectedInterests.isNotEmpty ? selectedInterests.join(', ') : 'None'}",
    );
    print("=================================================");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Owie's Profile")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/owie.jpg'),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Description:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                "My name is Owie Bexlerr Muyco. I'm currently studying at West Visayas State University. I am also a 3rd year student currently taking a bachelors degree called Bachelor of Science in Information Systems major in Business Applications Development and I like to cook and hoping to be a Millionaire in the end of 30's.",
              ),
              const SizedBox(height: 20),
              TextField(
                controller: profilename,
                decoration: const InputDecoration(labelText: 'Enter your name'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: profileemail,
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Select your interests:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Column(
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
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitData,
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
