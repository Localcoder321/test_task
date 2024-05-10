import 'package:flutter/material.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ColoredBox(
        color: Colors.black,
        child: Center(
          child: Text(
            "Отели",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
