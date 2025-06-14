import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/view/register/regScreen.dart';

class WelcomeScreenRegButton extends StatelessWidget {
  const WelcomeScreenRegButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: DefaultColors.componentBackgroud,
        backgroundColor: DefaultColors.componentFont,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: DefaultColors.componentBackgroud),
        ),
        minimumSize: const Size(320, 53),
      ),
      child: const Text(
        'Cadastre-se',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
