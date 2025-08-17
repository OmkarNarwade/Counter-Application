import 'package:flutter/material.dart';
import '../data/user_repo.dart';
import '../pages/home_page.dart';
import 'animated_text_field.dart';
import 'card_container.dart';
import 'hover_fill_button.dart';

class SignInCard extends StatefulWidget {
  final VoidCallback onSwitch;
  const SignInCard({super.key, required this.onSwitch});

  @override
  State<SignInCard> createState() => _SignInCardState();
}

class _SignInCardState extends State<SignInCard> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _showSnack(BuildContext ctx, String msg) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Welcome Back!",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 16),
              Text("Login to continue to your account and explore.",
                  style: TextStyle(fontSize: 16, color: Colors.white70)),
            ],
          ),
        ),
        const SizedBox(width: 24),
        CardContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Sign In",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 16),
              AnimatedTextField(label: "Email", controller: _email),
              const SizedBox(height: 16),
              AnimatedTextField(
                  label: "Password", controller: _password, obscureText: true),
              const SizedBox(height: 24),
              HoverFillButton(
                text: "Login",
                onPressed: () {
                  final email = _email.text.trim();
                  final password = _password.text;

                  if (email.isEmpty || password.isEmpty) {
                    _showSnack(context, "Please provide email and password");
                    return;
                  }

                  final ok =
                      UserRepo.authenticate(email: email, password: password);
                  if (ok) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  } else {
                    _showSnack(context, "Invalid email or password");
                  }
                },
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: widget.onSwitch,
                child: RichText(
                  text: const TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.white70),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
