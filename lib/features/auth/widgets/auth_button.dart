import 'package:flutter/material.dart';

final class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.buttonName,
    required this.onPressed,
    super.key,
  });
  final String buttonName;

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 2, // Hafif gölge
      ),
      child: Text(buttonName),
    );
  }
}
