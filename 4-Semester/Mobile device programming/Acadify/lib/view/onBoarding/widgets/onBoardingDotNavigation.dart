import 'package:flutter/material.dart';
import 'package:proj_eng/controller/onboarding_controller.dart';
import 'package:proj_eng/model/Constants/device_utility.dart';
import 'package:proj_eng/model/Constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardoDotNavigation extends StatelessWidget {
  const OnBoardoDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
      bottom: TDevice.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      
      child:
        SmoothPageIndicator(
          controller: controller.pageController, 
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: const ExpandingDotsEffect(
            activeDotColor: Colors.red,
            dotHeight: 5,
          )
      ),
    );
  }
}