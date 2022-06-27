import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/onboarding/models/onboarding_model.dart';
import 'package:get/get.dart';

import '../../login/views/login_view.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length-1;
  bool get isFirstPage => selectedPageIndex.value == 0;

  forwardAction() {
    // selectedPageIndex++;
    if(isLastPage) {
      Get.to(() => LoginView());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
      selectedPageIndex++;
    }

  }

  backAction() {
    // selectedPageIndex--;
    if(isFirstPage) {

    } else {
      pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
      selectedPageIndex--;
    }

  }

  List<OnBoardingModel> onBoardingPages = [
    OnBoardingModel(
        imageAsset: 'assets/images/restaurant.png',
        title:  'DISCOVER PLACE NEAR YOU',
        description:  'We make it simple to find the food you crave. Enter your address and let us do rest.'
    ),
    OnBoardingModel(
        imageAsset: 'assets/images/dish.png',
        title:  'CHOOSE A TASTY DISH',
        description:  'When you order eat street we\'ll hook you up with exclusive coupons, special discount and rew.'
    ),
    OnBoardingModel(
        imageAsset: 'assets/images/delivery.png',
        title:  'PICK UP OR DELIVERY',
        description:  'We make food ordering fast, simple and free - no master if you order online or cash.'
    ),
  ];

}