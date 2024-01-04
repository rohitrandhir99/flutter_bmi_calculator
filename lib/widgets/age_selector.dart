import 'package:bmi_app/controller/bmi_controller.dart';
import 'package:bmi_app/widgets/sec_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgeSelector extends StatelessWidget {
  const AgeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    // bmi controller
    BmiController bmiController = Get.put(BmiController());

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Age (Years)",
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  "${bmiController.age.value}",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ],
          ),
          // buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SecBtn(
                onPress: () {
                  // increase the age value
                  bmiController.age.value++;
                },
                icon: Icons.add,
              ),
              SecBtn(
                onPress: () {
                  // decrease the age value
                  // stop if it hit's five
                  if (bmiController.age.value > 5) {
                    bmiController.age.value--;
                  }
                },
                icon: Icons.minimize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
