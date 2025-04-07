import 'package:flutter/material.dart';
import 'package:proj_eng/view/loginScreen/loginScreen.dart';

class LogInPrompt extends StatelessWidget {
  const LogInPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Já possui conta?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
          },
          child: const Text(
            "Entre",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}