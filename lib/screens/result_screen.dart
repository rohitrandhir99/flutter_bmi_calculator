import 'package:bmi_app/controller/bmi_controller.dart';
import 'package:bmi_app/widgets/app_bar.dart';
import 'package:bmi_app/widgets/ract_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bmi controller
    BmiController bmiController = Get.put(BmiController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                // app bar
                MyAppBar(
                  onPress: () {
                    Get.back();
                  },
                  title: "Back",
                  icon: Icons.arrow_back_ios,
                ),
                const SizedBox(height: 20),
                // bmi details
                Row(
                  children: [
                    Obx(
                      () => Text(
                        "Your BMI is",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: bmiController.colorStatus.value,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: Expanded(
                    child: Obx(
                      () => CircularPercentIndicator(
                        radius: 120.0,
                        lineWidth: 30.0,
                        // convert the bmi value into percentage
                        percent: bmiController.bmi.value / 100,
                        animation: true,
                        animationDuration: 1000,
                        circularStrokeCap: CircularStrokeCap.round,
                        // bmi value for one decimal place
                        center: Text(
                          bmiController.bmi.value.toStringAsFixed(1),
                          style: TextStyle(
                            color: bmiController.colorStatus.value,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        footer: Text(
                          bmiController.bmiStatus.value,
                          style: TextStyle(
                            color: bmiController.colorStatus.value,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        progressColor: bmiController.colorStatus.value,
                        backgroundColor:
                            // opacity for the progress indicator background
                            bmiController.colorStatus.value.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => Text(
                      "Your BMI is ${bmiController.bmi.value.toStringAsFixed(1)}, indicating that your weight is in the normal range for adults of your height. For your height the normal weight range would be 53.5 to 72 kilograms. Maintaining a healthy weight may reduce the risk of chronic diseases associated with  overweight and obesity.",
                      style: const TextStyle(
                        height: 1.5,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                MyRactButton(
                  onPress: () {
                    Get.back();
                  },
                  btnName: "Calculate Again",
                  icon: Icons.arrow_back_ios,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
