import 'package:flutter/material.dart';
import '../data/user_repo.dart';
import '../pages/home_page.dart';
import 'animated_text_field.dart';
import 'card_container.dart';
import 'hover_fill_button.dart';

class SignUpCard extends StatefulWidget {
  final VoidCallback onSwitch;
  const SignUpCard({super.key, required this.onSwitch});

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _showSnack(BuildContext ctx, String msg) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _fullname.dispose();
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
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Join Us!",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 16),
              Text("Create your account and start your journey with us today.",
                  style: TextStyle(fontSize: 16, color: Colors.white70)),
            ],
          ),
        ),
        const SizedBox(width: 24),
        CardContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Sign Up",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 16),
              AnimatedTextField(label: "Full Name", controller: _fullname),
              const SizedBox(height: 16),
              AnimatedTextField(label: "Email", controller: _email),
              const SizedBox(height: 16),
              AnimatedTextField(
                  label: "Password", controller: _password, obscureText: true),
              const SizedBox(height: 24),
              HoverFillButton(
                text: "Register",
                onPressed: () async {
                  final fullname = _fullname.text.trim();
                  final email = _email.text.trim();
                  final password = _password.text;

                  if (fullname.isEmpty || email.isEmpty || password.isEmpty) {
                    _showSnack(context, "Please complete all fields");
                    return;
                  }

                  final success = await UserRepo.createUser(
                      fullname: fullname, email: email, password: password);

                  if (success) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  } else {
                    _showSnack(
                        context, "Email already registered or invalid data");
                  }
                },
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: widget.onSwitch,
                child: RichText(
                  text: const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.white70),
                    children: [
                      TextSpan(
                        text: "Sign In",
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
