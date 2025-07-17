import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:proj_eng/view/welcomeScreen/welcome_screen.dart';

class OnboardingController extends GetxController{
  static OnboardingController get instance => Get.find();


  //Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //functions

  //Update current index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //Jump to the specific dot select page.
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //Update current index & jump to next page
  void nextPage(){
    if(currentPageIndex.value == 2){
      Get.to(WelcomeScreen());
    }else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //Update current index & jump to last page
  void skipPage(){
  currentPageIndex.value = 2;
  pageController.jumpToPage(2);
  }
}