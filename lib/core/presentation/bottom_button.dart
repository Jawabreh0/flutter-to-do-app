import 'package:flutter/material.dart';
import 'package:todo/core/constants/palette.dart';

class CustomBottomButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;

  const CustomBottomButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 75.0, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: appSecondaryColor,
          minimumSize: const Size.fromHeight(45),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
