import 'package:flutter/material.dart';
import 'auth_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  Widget homeButton(
      IconData icon, String label, VoidCallback onPressed, Color color) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [color.withOpacity(0.9), color.withOpacity(0.6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 26, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const AuthPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Counter App"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: "Logout",
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24),
                ),
                child: Column(
                  children: [
                    Text("$counter",
                        style: const TextStyle(
                            fontSize: 90,
                            fontWeight: FontWeight.bold,
                            color: Colors.purpleAccent)),
                    const SizedBox(height: 8),
                    const Text("Your current count",
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  homeButton(Icons.add, "Add", () => setState(() => counter++),
                      Colors.green),
                  homeButton(Icons.remove, "Remove",
                      () => setState(() => counter--), Colors.red),
                  homeButton(Icons.refresh, "Reset",
                      () => setState(() => counter = 0), Colors.blueAccent),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
