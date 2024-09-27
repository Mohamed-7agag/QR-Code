import 'package:flutter/material.dart';

void successSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 1),
      showCloseIcon: true,
      content: Text(text),
    ),
  );
}

void errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red[600],
      duration: const Duration(seconds: 1),
      showCloseIcon: true,
      content: Text(text),
    ),
  );
}
