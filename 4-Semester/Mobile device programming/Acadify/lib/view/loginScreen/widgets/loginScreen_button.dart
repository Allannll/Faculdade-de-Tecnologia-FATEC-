import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:proj_eng/controller/autentication_repository.dart';
import 'package:proj_eng/utils/navigation_menu.dart';
class LoginButton extends StatelessWidget {
  final AuthenticatorRepository auth;

  const LoginButton({
    super.key, 
    required this.auth
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 300,
      child: ElevatedButton(
        onPressed: () async {
          final success = await auth.handleLogin(context);

          if (success) {
            Get.to(() => NavigationMenu());
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Entrar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
