
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_eng/controller/onboarding_controller.dart';
import 'package:proj_eng/model/Constants/images.dart';
import 'package:proj_eng/view/onBoarding/widgets/onBoardingDotNavigation.dart';
import 'package:proj_eng/view/onBoarding/widgets/onBoardingNextButton.dart';
import 'package:proj_eng/view/onBoarding/widgets/onBoardingPage.dart';
import 'package:proj_eng/view/onBoarding/widgets/onBoardingSkip.dart';

class Onboardingscreen extends StatelessWidget{
  const Onboardingscreen({super.key});

    @override
    Widget build(BuildContext context) {
      final controller = Get.put(OnboardingController());
      return Scaffold(  
        body: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnboardingPage(
                  image: TImages.onBoardingImage1,
                  title: 'title',
                  subtitle: 'subtitle',
                ),

                OnboardingPage(
                  image: TImages.onBoardingImage2,
                  title: 'title2',
                  subtitle: 'subtitle2',
                ),

                OnboardingPage(
                  image: TImages.onBoardingImage1,
                  title: 'title3',
                  subtitle: 'subtitle3',
                ),
              ],
            ),

            const onBoardingSkip(),

            OnBoardoDotNavigation(),

            OnboardingNextButton(),

          ],
        )
      );
    }
}
