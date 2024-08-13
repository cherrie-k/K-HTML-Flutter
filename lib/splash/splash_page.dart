import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6FC296),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 170,
          height: 170,
        ),
      ),
    );
  }
}
