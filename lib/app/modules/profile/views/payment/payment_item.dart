import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);

  final String? text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.all(10),
          backgroundColor: Colors.white,
        ),
        onPressed: press,
        child: Row(
          children: [
            SizedBox(width: 10),
            Expanded(child: Text(text!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
            Icon(Icons.chevron_right, size: 20,),
          ],
        ),
      ),
    );
  }
}
