import 'package:flutter/material.dart';
import 'package:proj_eng/controller/onboarding_controller.dart';
import 'package:proj_eng/model/Constants/device_utility.dart';
import 'package:proj_eng/model/Constants/sizes.dart';

class onBoardingSkip extends StatelessWidget {
    const onBoardingSkip({
      super.key,
    });

    @override
    Widget build(BuildContext context) {
      return Positioned(
        top: TDevice.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(  
          onPressed: () => OnboardingController.instance.skipPage(),
          child: const Text(
          'Pular',
          style: TextStyle(
            color: Colors.blue
          ),
          )
        ),
      ); 
    }
  }