import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreenTextBox extends StatelessWidget {
  const LoginScreenTextBox({
    super.key, 
    required this.text, 
    required this.emailLoginController, 
    required this.passwordLoginController
    });

  final String text;
  final TextEditingController emailLoginController, passwordLoginController;
  
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          TextFormField(
            controller: emailLoginController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF2F2F2),
              prefixIcon: Icon(Iconsax.direct_right, color: Colors.grey),
              labelText: "E-mail",
              labelStyle: TextStyle(color: Colors.grey),
              floatingLabelStyle: TextStyle(color: Colors.red),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.red, width: 2), 
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: passwordLoginController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF2F2F2),
              prefixIcon: Icon(Iconsax.password_check, color: Colors.grey),
              labelText: "Senha",
              labelStyle: TextStyle(color: Colors.grey),
              floatingLabelStyle: TextStyle(color: Colors.red),
              suffixIcon: Icon(Iconsax.eye_slash),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.red, width: 2),
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}