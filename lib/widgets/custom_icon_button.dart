import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      icon: Icon(icon),
      iconAlignment: IconAlignment.end,
      label: Text(text, style: const TextStyle(fontSize: 18)),
    );
  }
}
