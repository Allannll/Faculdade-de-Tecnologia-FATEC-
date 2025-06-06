import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';

class welcomeScreen_divider extends StatelessWidget {
  const welcomeScreen_divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: DefaultColors.font,
            thickness: 1,
            indent: 40,
            endIndent: 10,
          ),
        ),
        const Text(
          'Ou',
          style: TextStyle(
            fontSize: 15, 
            color: DefaultColors.font,
          ),
        ),
        Expanded(
          child: Divider(
            color: DefaultColors.font,
            thickness: 1,
            indent: 10,
            endIndent: 40,
          ),
        ),
      ],
    );
  }
}