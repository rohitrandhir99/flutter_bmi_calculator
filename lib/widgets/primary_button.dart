import 'package:bmi_app/controller/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  final IconData icon;
  final String btnName;
  final VoidCallback onPress;

  const PrimaryButton({
    super.key,
    required this.icon,
    required this.btnName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    // bmi controller
    BmiController bmiController = Get.put(BmiController());

    return Expanded(
      child: InkWell(
        onTap: onPress,
        // we have used Obx in order to change the state when the 'MALE' & 'FEMALE'
        // button is tapped.
        child: Obx(
          () => Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bmiController.currentGender.value == btnName
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: bmiController.currentGender.value == btnName
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Text(
                  btnName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: bmiController.currentGender.value == btnName
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}