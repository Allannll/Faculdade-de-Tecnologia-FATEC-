import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            color: Colors.white,
            thickness: 1,
            indent: 40,
            endIndent: 10,
          ),
        ),
        const Text(
          'Ou',
          style: TextStyle(
            fontSize: 15, 
            color: Colors.white
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
            indent: 10,
            endIndent: 40,
          ),
        ),
      ],
    );
  }
}