import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RegScreenTextBox extends StatelessWidget {
  const RegScreenTextBox({
    super.key, 
    required this.text, 
    required this.emailController, 
    required this.passwordController, 
    required this.nameController, 
    required this.lastNameController
    });

  final String text;
  final TextEditingController emailController, passwordController, nameController, lastNameController;
  
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: nameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF2F2F2),
                    labelText: "Nome",
                    prefixIcon: Icon(Iconsax.user),
                    labelStyle: TextStyle(color: Colors.grey),
                    floatingLabelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  expands: false,
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF2F2F2),
                    labelText: "Sobrenome",
                    prefixIcon: Icon(Iconsax.user),
                    labelStyle: TextStyle(color: Colors.grey),
                    floatingLabelStyle: TextStyle(color: Colors.red),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
              ),
            ],
          ),

          const SizedBox(height: 10),
          
          TextFormField(
            controller: emailController,
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
            controller: passwordController,
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