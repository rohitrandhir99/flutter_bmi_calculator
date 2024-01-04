import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData icon;

  const MyAppBar({
    super.key,
    required this.onPress,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onPress,
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
