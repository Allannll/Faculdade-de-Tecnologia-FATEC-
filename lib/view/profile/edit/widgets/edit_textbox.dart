import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_eng/model/Constants/colors.dart';

class EditScreenTextBox extends StatelessWidget {
  const EditScreenTextBox({
    super.key,
    required this.text,
    required this.textboxController,
    this.icon = Iconsax.direct_right,
  });

  final String text;
  final TextEditingController textboxController;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: textboxController,
          style: const TextStyle(color: DefaultColors.componentFont),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF2F2F2),
            prefixIcon: Icon(icon, color: DefaultColors.componentFont),
            labelText: text,
            labelStyle: const TextStyle(color: Colors.grey),
            floatingLabelStyle: const TextStyle(color: DefaultColors.componentFont),
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
        const SizedBox(height: 10),
      ],
    );
  }
}
