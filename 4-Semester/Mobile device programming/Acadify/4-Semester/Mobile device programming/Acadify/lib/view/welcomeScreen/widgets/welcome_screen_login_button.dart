import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/view/login/login_screen.dart';

class WelcomeScreenLoginButton extends StatelessWidget {
  const WelcomeScreenLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: DefaultColors.componentFont,
        backgroundColor: DefaultColors.componentBackgroud,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: DefaultColors.componentBackgroud),
        ),
        minimumSize: const Size(320, 53),
      ),
      child: const Text(
        'Entre',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
