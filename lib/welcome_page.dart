import 'package:flutter/material.dart';
import 'package:shopper_demo/home_page.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final _usernameController = TextEditingController(text: "Demo");
  final _passwordController = TextEditingController(text: "123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _usernameController,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomePage()));
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                ),
                child: const Text("ENTER"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
