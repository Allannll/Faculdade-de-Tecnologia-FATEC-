import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Ainda não tem conta?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Cadastre-se",
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