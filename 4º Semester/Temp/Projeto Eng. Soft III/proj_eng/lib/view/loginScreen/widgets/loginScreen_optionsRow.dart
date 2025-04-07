import 'package:flutter/material.dart';
import 'package:proj_eng/view/password/forgetPassword/forgetPassword.dart';

class LoginOptionsRow extends StatelessWidget {
  const LoginOptionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
              activeColor: Colors.red,
            ),
            const Text(
              "Manter-me conectado",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Forgetpassword()),
            );
          },
          child: const Text(
            'Esqueceu a senha?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
