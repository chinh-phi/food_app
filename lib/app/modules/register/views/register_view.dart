import 'package:flutter/material.dart';
import 'package:food_app_247/app/modules/login/views/login_view.dart';
import 'package:food_app_247/dimensions.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final RegisterController controller = Get.put(RegisterController());

  final _usernameTextController = TextEditingController(text: "");
  final _nameTextController = TextEditingController(text: "");
  final _passwordTextController = TextEditingController(text: "");
  final _confirmPasswordTextController = TextEditingController(text: "");

  var _passwordVisible = true;
  var _confirmPasswordVisible = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
            children: [
              SizedBox(
                  width: Dimensions.screenWidth,
                  height: Dimensions.screenHeight,
                child: Column(
                  children: [
                    Container(
                      height: Dimensions.screenHeight*0.45,
                      color: Dimensions.primaryColor,

                    ),
                    Container(
                      color: Colors.white
                    )
                  ]
                )
              ),
              Positioned(
                top: Dimensions.screenHeight*0.1,
                child: _buildLogo(),
              ),

              Positioned(
                top: Dimensions.screenHeight*0.45 - 150,
                child: ClipPath(
                  clipper: Custom1Clipper(),
                  child: Container(
                    height: 300,
                    width: Dimensions.screenWidth,
                    color: Colors.white
                  )
                )
              ),
              Positioned(
                  top: Dimensions.screenHeight*0.25,
                  left: Dimensions.screenWidth*0.1,
                  child: Container(
                    // height: Dimensions.screenHeight*0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            offset: const Offset(
                              1.0,
                              1.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow//BoxShadow
                        ],
                      ),
                      child: SizedBox(
                          width: Dimensions.screenWidth*0.8,
                          child: Form(
                              key: _formKey,
                              child: Center(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    //username input
                                    Container(
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                      alignment: Alignment.center,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.person_outline_rounded,
                                          ),
                                          hintText: "Username",
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Dimensions.greyColor)
                                          ),
                                          contentPadding: EdgeInsets.all(10),
                                          hintStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(153, 160, 160, 160)),
                                        ),
                                        enabled: !controller.registerProgress.value,
                                        controller: _usernameTextController,
                                        validator: (String? value) => value!.trim().isEmpty
                                            ? "Username is require"
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    //name
                                    Container(
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                      alignment: Alignment.center,
                                      child: TextFormField(
                                        enabled: !controller.registerProgress.value,
                                        controller: _nameTextController,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.email_outlined,
                                          ),
                                          hintText: "Name",
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Dimensions.greyColor)
                                          ),
                                          contentPadding: EdgeInsets.all(10),
                                          hintStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(153, 160, 160, 160),
                                          ),
                                        ),
                                        // obscureText: _passwordVisible,
                                        validator: (String? value) => value!.trim().isEmpty
                                            ? "Name is require"
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
                                        enabled: !controller.registerProgress.value,
                                        controller: _passwordTextController,
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.lock_outlined,
                                          ),
                                          hintText: "Password",
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
                                    const SizedBox(height: 16),
                                    //confirm password
                                    Container(
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(horizontal: 30),
                                      alignment: Alignment.center,
                                      child: TextFormField(
                                        enabled: !controller.registerProgress.value,
                                        controller: _confirmPasswordTextController,
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.lock_outlined,
                                          ),
                                          hintText: "Confirm Password",
                                          border: const UnderlineInputBorder(
                                              borderSide: BorderSide(color: Dimensions.greyColor)
                                          ),
                                          contentPadding: const EdgeInsets.all(10),
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _confirmPasswordVisible
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color: Dimensions.primaryColor,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _confirmPasswordVisible = !_confirmPasswordVisible;
                                              });
                                            },
                                          ),
                                          hintStyle: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(153, 160, 160, 160),
                                          ),
                                        ),
                                        obscureText: _confirmPasswordVisible,
                                        validator: (String? value) {
                                          if(value!.trim().isEmpty) {
                                            return "Confirm password is require";
                                          } else {
                                            if(value.trim() != _passwordTextController.text) {
                                              return "Confirm Password is incorrect!";
                                            } else {
                                              return null;
                                            }
                                          }

                                        }
                                      ),
                                    ),
                                    const SizedBox(height: 40),

                                  ],
                                ),
                              )
                          )
                      )
                  )
              ),
              Positioned(
                  top: Dimensions.screenHeight*0.53-10,
                  left: Dimensions.screenWidth*0.2,
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                    child: MaterialButton(
                      minWidth: Dimensions.screenWidth*0.6,
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String message = await controller.register(
                              username: _usernameTextController.text,
                              password: _passwordTextController.text,
                              name: _nameTextController.text,
                          );
                          Get.defaultDialog(
                              title: "Oop!", middleText: message);
                          await Future.delayed(const Duration(seconds: 2), () {
                            Navigator.of(context).pop(true);
                          });
                          if(message == "Đăng kí thành công") {
                            Get.offAll(const LoginView());
                          }
                        }
                      },
                      child: const Text(
                        "SIGN UP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
              ),
              Positioned(
                top: Dimensions.screenHeight*0.6,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: Dimensions.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      InkWell(
                        child: const Text('Sign in', style: TextStyle(color: Dimensions.primaryColor)),
                        onTap: () {
                          Get.to(() => const LoginView());
                        }
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Positioned(
                left: -80,
                bottom: -80,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/img.png',
                      ),
                      fit: BoxFit.contain
                    ),
                    shape: BoxShape.circle
                  ),
                )
              )

            ]
        )
      ),
    );


  }

  _buildLogo() {
    return SizedBox(
      width: Dimensions.screenWidth,
      height: Dimensions.screenHeight,
      child: Column(
        children: const [
          SizedBox(height: 20),
          Text('Signup', style: TextStyle(fontSize: 32, color: Dimensions.whiteColor, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("It's great to see you", style: TextStyle(fontSize: 16, color: Dimensions.whiteColor))
        ],
      ),
    );
  }
}

class Custom1Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0,size.height*1/2);
    path.lineTo(size.width*1/2, 0);
    path.lineTo(size.width, size.height*1/2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}
