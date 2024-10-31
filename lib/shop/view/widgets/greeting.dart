import 'package:flutter/material.dart';

class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
          text: 'Hello Kante, ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
              text: 'What fruit salad combo do you want today?',
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ]),
    );
  }
}
