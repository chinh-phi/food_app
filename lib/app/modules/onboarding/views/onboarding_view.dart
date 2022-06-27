import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';
class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OnBoardingController());
    return Scaffold(
        body: Obx(() => SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.selectedPageIndex,
                  itemCount: controller.onBoardingPages.length,
                  itemBuilder: (context,index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(controller.onBoardingPages[index].imageAsset ?? ''),
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                            controller.onBoardingPages[index].title ?? '',
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64),
                          child: Text(
                            controller.onBoardingPages[index].description ?? '',
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  }
              ),
              _buildControl()
            ],
          ),
        )
    ));
  }

  _buildDot() {
    return Row(
        children: List.generate(
            controller.onBoardingPages.length,
                (index) => Obx(() {
              return Center(
                child: Container(
                  margin: const EdgeInsets.all(4),
                  width: controller.selectedPageIndex.value == index ? 20 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                      color: controller.selectedPageIndex.value == index ? Dimensions.primaryColor : Dimensions.greyColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              );
            }
            )
        )
    );
  }

  _buttonControl(title, function, state) {
    return TextButton(
      style: TextButton.styleFrom(
          textStyle: const TextStyle(fontSize: 18),
          backgroundColor: !state ? Dimensions.primaryColor : Dimensions.greyColor
      ),
      onPressed: () {
        function();
      },
      child: Text('$title', style: const TextStyle(color: Dimensions.whiteColor)),
    );
  }

  _buildControl() {
    return Positioned(
      bottom: 20,
      child: SizedBox(
        width: Dimensions.screenWidth - Dimensions.screenWidth*0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buttonControl('Back', controller.backAction, controller.isFirstPage),
            _buildDot(),
            _buttonControl('Next', controller.forwardAction, false)
          ],
        ),
      )
    );
  }


}