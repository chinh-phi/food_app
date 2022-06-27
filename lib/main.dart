import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app_247/app/routes/app_pages.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: Dimensions.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Define the default font family.
        fontFamily: 'Joan',
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
