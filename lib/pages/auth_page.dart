import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/sign_in_card.dart';
import '../widgets/sign_up_card.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  bool showSignIn = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  void toggleView() {
    if (showSignIn) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/B_image.jpg", fit: BoxFit.cover),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                double angle = _controller.value * pi;
                bool isFront = angle <= pi / 2;

                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(angle),
                  child: isFront
                      ? SignInCard(onSwitch: toggleView)
                      : Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..rotateY(pi),
                          child: SignUpCard(onSwitch: toggleView),
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
