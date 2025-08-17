import 'package:flutter/material.dart';

class AnimatedTextField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;
  const AnimatedTextField(
      {super.key,
      required this.label,
      this.obscureText = false,
      this.controller});

  @override
  State<AnimatedTextField> createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<AnimatedTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controllerAnim = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _slideAnim = Tween<Offset>(begin: const Offset(-1.5, 0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controllerAnim, curve: Curves.easeOut));
    _controllerAnim.forward();
  }

  @override
  void dispose() {
    _controllerAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnim,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white38),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
        ),
      ),
    );
  }
}
