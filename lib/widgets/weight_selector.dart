import 'package:bmi_app/controller/bmi_controller.dart';
import 'package:bmi_app/widgets/sec_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeightSelector extends StatelessWidget {
  const WeightSelector({super.key});

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
                "Weight (Kg's)",
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
                  "${bmiController.weight.value}",
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
                  // increase the weight value
                  bmiController.weight.value++;
                },
                icon: Icons.add,
              ),
              SecBtn(
                onPress: () {
                  // decrease the weight value
                  // stop if it hit's five
                  if (bmiController.weight.value > 5) {
                    bmiController.weight.value--;
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
