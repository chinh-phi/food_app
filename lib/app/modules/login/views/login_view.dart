import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/register/views/register_view.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';

import '../../dashboard/views/dashboard_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController controller = Get.put(LoginController());

  final _emailTextController = TextEditingController(text: "");
  final _passwordTextController = TextEditingController(text: "");
  var _passwordVisible = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            return Form(
                key: _formKey,
                child: Center(
                  child: SizedBox(
                    height: Dimensions.screenHeight,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildLogo(),
                          const SizedBox(height: 20),
                          //username input
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            alignment: Alignment.center,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Username",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Dimensions.greyColor)
                                ),
                                contentPadding: EdgeInsets.all(10),
                                hintStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(153, 160, 160, 160)),
                              ),
                              enabled: !controller.loginProcess.value,
                              controller: _emailTextController,
                              validator: (String? value) => value!.trim().isEmpty
                                  ? "Username is require"
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 16),
                          //password input
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            alignment: Alignment.center,
                            child: TextFormField(
                              enabled: !controller.loginProcess.value,
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                hintText: "Mật khẩu",
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Dimensions.greyColor)
                                ),
                                contentPadding: const EdgeInsets.all(10),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Dimensions.primaryColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                hintStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(153, 160, 160, 160),
                                ),
                              ),
                              obscureText: _passwordVisible,
                              validator: (String? value) => value!.trim().isEmpty
                                  ? "Password is require"
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 10),
                          //button forgot password
                          InkWell(
                            child: const Text('Forgot Password?', style: TextStyle(color: Dimensions.primaryColor)),
                            onTap: () {
                              print('Forgot Password');
                            },
                          ),
                          const SizedBox(height: 20),
                          //button login
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(10),
                            color: controller.loginProcess.value
                                ? Theme.of(context).disabledColor
                                : Theme.of(context).primaryColor,
                            child: MaterialButton(
                              minWidth: Dimensions.screenWidth*0.8,
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                              onPressed: () async {
                                // Get.offAll(() => DashboardView());
                                if (_formKey.currentState!.validate()) {
                                  String error = await controller.login(
                                      username: _emailTextController.text,
                                      password: _passwordTextController.text);
                                  if (error != "") {
                                    Get.defaultDialog(
                                        title: "Oop!", middleText: error);
                                  } else {
                                    // print(error);
                                    Get.offAll(DashboardView());
                                  }
                                }
                              },
                              child: const Text(
                                "SIGN IN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          //button register
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              InkWell(
                                child: const Text('Sign up', style: TextStyle(color: Dimensions.primaryColor, fontWeight: FontWeight.bold)),
                                onTap: () {
                                  Get.to(() => const RegisterView());
                                }
                              )
                            ],
                          )
                        ]),
                  ),
                ));
          }),
        ),
      ),
    );


  }

  _buildLogo() {
    return Column(
      children: [
        SizedBox(
            width: 200,
            child: Image.asset(
              'assets/images/logo-eat-247.png',
              fit: BoxFit.contain,
            )
        ),
        const SizedBox(height: 20),
        const Text('Welcome Back', style: TextStyle(fontSize: 32, color: Dimensions.textColor, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text('Sign in to continue', style: TextStyle(fontSize: 16, color: Dimensions.textColor.withOpacity(0.8))),
      ],
    );
  }

}
