import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_eng/model/Constants/colors.dart';

class LoginScreenTextBox extends StatefulWidget {
  const LoginScreenTextBox({
    super.key,
    required this.text,
    required this.emailLoginController,
    required this.passwordLoginController,
  });

  final String text;
  final TextEditingController emailLoginController, passwordLoginController;

  @override
  State<LoginScreenTextBox> createState() => _LoginScreenTextBoxState();
}

class _LoginScreenTextBoxState extends State<LoginScreenTextBox> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          TextFormField(
            controller: widget.emailLoginController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFFF2F2F2),
              prefixIcon: Icon(Iconsax.direct_right, color: Colors.grey),
              labelText: "E-mail",
              labelStyle: TextStyle(color: Colors.grey),
              floatingLabelStyle: TextStyle(color: DefaultColors.componentFont),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: DefaultColors.componentFont, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: widget.passwordLoginController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF2F2F2),
              prefixIcon: const Icon(Iconsax.password_check, color: Colors.grey),
              labelText: "Senha",
              labelStyle: const TextStyle(color: Colors.grey),
              floatingLabelStyle: const TextStyle(color: DefaultColors.componentFont),
              suffixIcon: IconButton(
                icon: Icon(_obscurePassword ? Iconsax.eye_slash : Iconsax.eye),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: DefaultColors.componentFont, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
