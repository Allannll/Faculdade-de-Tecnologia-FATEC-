import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_eng/model/Constants/colors.dart';

class RegScreenTextBox extends StatefulWidget {
  const RegScreenTextBox({
    super.key,
    required this.text,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.lastNameController,
  });

  final String text;
  final TextEditingController emailController, passwordController, nameController, lastNameController;

  @override
  State<RegScreenTextBox> createState() => _RegScreenTextBoxState();
}

class _RegScreenTextBoxState extends State<RegScreenTextBox> {
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;
  bool _obscurePassword = true;

  void validatePassword(String password) {
    setState(() {
      hasUppercase = password.contains(RegExp(r'[A-Z]'));
      hasNumber = password.contains(RegExp(r'[0-9]'));
      hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  Widget passwordCriteria(String text, bool condition) {
    return Row(
      children: [
        Icon(
          condition ? Icons.check_circle : Icons.cancel,
          color: condition ? Colors.green : Colors.red,
          size: 16,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: condition ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    widget.passwordController.addListener(() {
      validatePassword(widget.passwordController.text);
    });
  }

  @override
  void dispose() {
    widget.passwordController.removeListener(() {
      validatePassword(widget.passwordController.text);
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name and Last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.nameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF2F2F2),
                    labelText: "Nome",
                    prefixIcon: Icon(Iconsax.user),
                    labelStyle: TextStyle(color: Colors.grey),
                    floatingLabelStyle: TextStyle(color: DefaultColors.componentFont),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: DefaultColors.componentFont, width: 2)),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: widget.lastNameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF2F2F2),
                    labelText: "Sobrenome",
                    prefixIcon: Icon(Iconsax.user),
                    labelStyle: TextStyle(color: Colors.grey),
                    floatingLabelStyle: TextStyle(color: DefaultColors.componentFont),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: DefaultColors.componentFont, width: 2)),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // E-mail
          TextFormField(
            controller: widget.emailController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Color(0xFFF2F2F2),
              prefixIcon: Icon(Iconsax.direct_right, color: Colors.grey),
              labelText: "E-mail",
              labelStyle: TextStyle(color: Colors.grey),
              floatingLabelStyle: TextStyle(color: DefaultColors.componentFont),
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: DefaultColors.componentFont, width: 2)),
            ),
          ),

          const SizedBox(height: 10),

          // Password
          TextFormField(
            controller: widget.passwordController,
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
              border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: DefaultColors.componentFont, width: 2)),
            ),
          ),

          const SizedBox(height: 10),

          // Password criteria
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              passwordCriteria("Ao menos uma letra maiúscula", hasUppercase),
              passwordCriteria("Ao menos um número", hasNumber),
              passwordCriteria("Ao menos um caractere especial", hasSpecialChar),
            ],
          ),
        ],
      ),
    );
  }
}

