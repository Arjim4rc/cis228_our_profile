import 'package:flutter/material.dart';
import 'profile_rj.dart';  // Import RJ's profile screen
import 'profile_owie.dart';  // Import Owie's profile screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final List<Map<String, String>> profiles = const [
    {
      "name": "RJ Marc Daligdig",
      "year": "3rd Year",
      "section": "CIS 228",
      "image": "assets/UR.jpg",
    },
    {
      "name": "Owie Bexlerr Muyco",
      "year": "3rd Year",
      "section": "CIS 228",
      "image": "assets/owie.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: profiles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (profiles[index]["name"] == "RJ Marc Daligdig") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileRJ()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileOwie()),
                  );
                }
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(profiles[index]["image"]!),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      profiles[index]["name"]!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      profiles[index]["year"]!,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      profiles[index]["section"]!,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
