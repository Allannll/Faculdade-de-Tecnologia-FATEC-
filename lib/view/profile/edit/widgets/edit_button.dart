import 'package:flutter/material.dart';
import 'package:proj_eng/controller/autentication_repository.dart';
import 'package:proj_eng/model/Constants/colors.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.auth,
  });

  final AuthenticatorRepository auth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: DefaultColors.componentFont,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () async {
          bool success = await auth.handleUpdateUser(context);
          if (success) {
            Navigator.pop(context, true);
          }
        },
        child: const Text(
          "Salvar",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}