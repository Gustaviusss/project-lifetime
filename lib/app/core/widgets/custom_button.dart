// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: IconButton(
        onPressed: onPressed,
        hoverColor: Colors.grey[800],
        icon: Icon(
          icon,
        ),
        color: Colors.white,
        iconSize: size,
      ),
    );
  }
}
