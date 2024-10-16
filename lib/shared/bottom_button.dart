import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;

  const BottomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width * 1, 50)),
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}
