import 'package:flutter/material.dart';

class MyRactButton extends StatelessWidget {
  final VoidCallback onPress;
  final String btnName;
  final IconData icon;

  const MyRactButton({
    super.key,
    required this.onPress,
    required this.btnName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      // we have used Obx in order to change the state when the 'MALE' & 'FEMALE'
      // button is tapped.
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            const SizedBox(width: 10),
            Text(
              btnName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
