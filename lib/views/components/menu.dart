import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final ValueChanged<int> onMenuClick;

  const Menu({super.key, required this.onMenuClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.access_time_sharp),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => onMenuClick(1),
                child: Text('seção 1'),
              ),
              TextButton(
                onPressed: () => onMenuClick(2),
                child: Text('seção 2'),
              ),
              TextButton(
                onPressed: () => onMenuClick(3),
                child: Text('seção 3'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
