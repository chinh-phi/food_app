import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 20),
      height: 130,
      width: double.infinity,
      color: Dimensions.primaryColor,
      child: Row(
        children: [
          const SizedBox(width: 15),
          SizedBox(
            height: 80,
            width: 80,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
                Positioned(
                  right: -10,
                  bottom: 0,
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(color: Colors.white),
                        ),
                        primary: Colors.black12,
                        backgroundColor: const Color(0xFFF5F6F9),
                      ),
                      onPressed: () {
                        print('camera');
                      },
                      child: const Icon(Icons.photo_camera, size: 17, color: Colors.black87,)
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 15),
          const Text('Chính Phí', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white)),
        ]
      ),
    );
  }
}