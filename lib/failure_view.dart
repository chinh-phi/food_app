import 'package:flutter/material.dart';

class FailureView extends StatelessWidget {
  final String? title;
  final String? message;
  final VoidCallback onPressed;

  const FailureView({Key? key, this.title = 'Error', this.message = "Something went wrong", required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 150,
          ),
          const SizedBox(height: 4),
          Text(title!, style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(height: 2),
          Text(message!, style: Theme.of(context).textTheme.bodyText2),
          const SizedBox(height: 2),
          ElevatedButton(
              onPressed: onPressed,
              child: const Text("Retry")
          )
        ],
      ),
    );
  }

}
