import 'package:flutter/material.dart';

class LoginSnackBar extends StatelessWidget {
  final String text;
  const LoginSnackBar(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(text));
  }
}