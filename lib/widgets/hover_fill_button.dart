import 'package:flutter/material.dart';

class HoverFillButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const HoverFillButton(
      {super.key, required this.text, required this.onPressed});

  @override
  State<HoverFillButton> createState() => _HoverFillButtonState();
}

class _HoverFillButtonState extends State<HoverFillButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isHovered ? Colors.white : Colors.transparent,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                  color: isHovered ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
