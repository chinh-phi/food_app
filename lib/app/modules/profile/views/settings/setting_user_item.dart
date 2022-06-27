import 'package:flutter/material.dart';

class SettingUserItem extends StatelessWidget {
  const SettingUserItem({
    Key? key,
    this.text,
    this.press,
    this.hintText,
    this.color = const Color(0xFFe8e8e8),
    this.child,
    this.option = true,
    this.haveChild = false
  }) : super(key: key);

  final String? text;
  final String? hintText;
  final VoidCallback? press;
  final Color? color;
  final Widget? child;
  final bool? option;
  final bool? haveChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.all(10),
          backgroundColor: Colors.white,
        ),
        onPressed: press,
        child: Row(
          children: [
            haveChild! ? Expanded(child: child!) : Expanded(child: Text(text!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87))),
            Text(hintText!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: color)),
            option! ? Icon(Icons.chevron_right, size: 20) : SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
