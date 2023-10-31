import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String title;
  final Function onMenuClick;

  MenuButton({super.key, required this.title, required this.onMenuClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onMenuClick,
      child: Text(title),
    );
  }
}
