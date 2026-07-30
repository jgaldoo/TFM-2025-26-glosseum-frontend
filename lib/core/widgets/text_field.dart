import 'package:flutter/material.dart';

class TextField extends StatefulWidget {
  final String placeholder;

  const TextField({
    super.key,
    required this.placeholder
  });

  @override
  State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  var _text;

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
