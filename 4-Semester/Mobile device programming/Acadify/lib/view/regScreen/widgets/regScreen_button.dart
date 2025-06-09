import 'package:flutter/material.dart';
import 'package:proj_eng/controller/autentication_repository.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/view/loginScreen/loginScreen.dart';

class RegButton extends StatelessWidget {
  final AuthenticatorRepository auth;

  const RegButton({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          final success = auth.handleRegister(context);
          if (success) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: DefaultColors.componentFont,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Cadastrar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: DefaultColors.font,
          ),
        ),
      ),
    );
  }
}
