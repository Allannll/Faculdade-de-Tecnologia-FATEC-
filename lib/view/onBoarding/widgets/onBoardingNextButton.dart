import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:proj_eng/controller/onboarding_controller.dart';
import 'package:proj_eng/model/Constants/colors.dart';
import 'package:proj_eng/model/Constants/device_utility.dart';
import 'package:proj_eng/model/Constants/sizes.dart';

class OnboardingNextButton extends StatelessWidget {
    const OnboardingNextButton({
      super.key,
    });            

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDevice.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: DefaultColors.componentFont,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          fixedSize: const Size(50, 50), 
        ),
        child: Icon(
          Iconsax.arrow_right_3,
          color: Colors.white,
        ),
      ),
    );
  }
}