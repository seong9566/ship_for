import 'package:flutter/material.dart';

class CustomDefaultButton extends StatelessWidget {
  const CustomDefaultButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.color,
    this.textColor,
  });

  final Color? color;
  final String text;
  final Color? textColor;
  final VoidCallback onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color ?? Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
