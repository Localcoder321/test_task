import 'package:flutter/material.dart';

class ShortDistancePage extends StatelessWidget {
  const ShortDistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ColoredBox(
        color: Colors.black,
        child: Center(
          child: Text(
            "Короче",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
