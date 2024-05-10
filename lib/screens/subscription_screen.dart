import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ColoredBox(
        color: Colors.black,
        child: Center(
          child: Text(
            "Подписки",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
