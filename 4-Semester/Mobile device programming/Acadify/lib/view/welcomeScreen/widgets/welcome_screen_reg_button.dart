import 'package:flutter/material.dart';
import 'package:proj_eng/model/Constants/colors.dart';
<<<<<<< HEAD:4-Semester/Mobile device programming/Acadify/lib/view/welcomeScreen/widgets/welcome_screen_reg_button.dart
import 'package:proj_eng/model/Constants/device_utility.dart';
import 'package:proj_eng/view/register/reg_screen.dart';
=======
import 'package:proj_eng/view/register/regScreen.dart';
>>>>>>> 776fac181408ada952540f440f7679fe5becd018:4-Semester/Mobile device programming/Acadify/lib/view/welcomeScreen/widgets/welcomeScreen_reg_button.dart

class WelcomeScreenRegButton extends StatelessWidget {
  const WelcomeScreenRegButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: DefaultColors.componentBackgroud,
        backgroundColor: DefaultColors.componentFont,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: DefaultColors.componentBackgroud),
        ),
        minimumSize: const Size(320, 53),
      ),
      child: const Text(
        'Cadastre-se',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
