import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_app_247/app/base/service/ServiceApi.dart';
import 'package:food_app_247/app/modules/login/views/login_view.dart';
import 'package:food_app_247/app/modules/onboarding/views/onboarding_view.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/modules/dashboard/views/dashboard_view.dart';
import 'app/modules/login/controllers/login_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 2), () {
      navigateUser();
    });
  }

  navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');
    int? initScreen = prefs.getInt("initScreen");
    if(initScreen == 0 || initScreen == null) {
      await prefs.setInt("initScreen", 1);
      Get.offAll(() => const OnBoardingView());

    } else {
      if (token != null) {
        try {
          bool refresh = await ServiceApi.refreshToken();
          print(token);
          if (refresh) {
            print(ServiceApi.getRefreshToken());
            Get.offAll(() => DashboardView());
          } else {
            Get.offAll(() => LoginView());
          }
        } catch (e) {
          Get.offAll(() => const LoginView());
        }
      } else {
        Get.offAll(() => const LoginView());
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Dimensions.screenHeight,
          width: Dimensions.screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash_background.png'),
                fit: BoxFit.cover
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: Dimensions.primaryColor.withOpacity(0.8)
          )
        ),
        Center(
          child: Container(
            width: Dimensions.screenWidth*0.8,
              height: Dimensions.screenHeight*0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/logo-eat-247-white.png'
                      ),
                      fit: BoxFit.contain
                  )
              )
          )
        )
      ],
    );
  }
}
