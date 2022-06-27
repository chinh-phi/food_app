import 'package:flutter/material.dart';
import 'package:food_app_247/dimensions.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    this.text,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? text;
  final IconData? icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Dimensions.primaryColor,
        padding: const EdgeInsets.all(20),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: const Color(0xFFF5F6F9),
      ),
      onPressed: press,
      child: Row(
        children: [
          Icon(
            icon,
            color: Dimensions.primaryColor,
            size: 22,
          ),
          const SizedBox(width: 20),
          Expanded(child: Text(text!)),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}