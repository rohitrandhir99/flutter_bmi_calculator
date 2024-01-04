import 'package:flutter/material.dart';

// button with icon
class SecBtn extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;

  const SecBtn({
    super.key,
    required this.onPress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
    );
  }
}
