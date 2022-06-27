import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
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
        primary: Colors.black,
        backgroundColor: Colors.white,
      ),
      onPressed: press,
      child: Row(
        children: [
          Icon(
            icon
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text!, style: const TextStyle(fontSize: 16))),
          const Icon(Icons.chevron_right, size: 20,),
        ],
      ),
    );
  }
}
