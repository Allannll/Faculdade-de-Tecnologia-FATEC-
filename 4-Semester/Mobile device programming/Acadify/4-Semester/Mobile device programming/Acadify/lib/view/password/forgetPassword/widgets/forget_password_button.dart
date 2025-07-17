import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_eng/controller/autentication_repository.dart';
import 'package:proj_eng/view/password/resetPassword/reset_password.dart';

class ForgetButton extends StatelessWidget {
  final AuthenticatorRepository auth;

  const ForgetButton({
    super.key,
    required this.auth
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
          final success = await auth.handleForgetPassword(context);

          if (success) {
            Get.to(() => ResetPassword());
          }
        },

      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const Text("Enviar"),
    );
  }
}