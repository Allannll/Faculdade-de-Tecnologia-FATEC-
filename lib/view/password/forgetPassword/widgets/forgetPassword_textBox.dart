import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class forgetPasswordTextBox extends StatelessWidget {
  const forgetPasswordTextBox({
    super.key,
    required this.text, 
    required this.forgetPasswordController, 
  });

  final String text;
  final TextEditingController forgetPasswordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: forgetPasswordController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF2F2F2),
        prefixIcon: Icon(Iconsax.direct_right, color: Colors.grey),
        labelText: text,
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
    );
  }
}