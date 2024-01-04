import 'package:bmi_app/controller/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HeightSelector extends StatelessWidget {
  const HeightSelector({super.key});

  @override
  Widget build(BuildContext context) {
    // bmi controller class instance
    BmiController bmiController = Get.put(BmiController());

    return Expanded(
      child: Container(
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
                  "Height (Cm's)",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                )
              ],
            ),
            Expanded(
              child: Obx(
                () => SfSlider.vertical(
                  min: 0.0,
                  max: 300.0,
                  value: bmiController.height.value,
                  interval: 20,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  minorTicksPerInterval: 1,
                  onChanged: (dynamic value) {
                    // whenever the value changes update it in bmiController.height.value
                   bmiController.height.value = value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
