import 'package:bmi_app/controller/bmi_controller.dart';
import 'package:bmi_app/controller/theme_controller.dart';
import 'package:bmi_app/screens/result_screen.dart';
import 'package:bmi_app/widgets/age_selector.dart';
import 'package:bmi_app/widgets/height_selector.dart';
import 'package:bmi_app/widgets/primary_button.dart';
import 'package:bmi_app/widgets/ract_button.dart';
import 'package:bmi_app/widgets/theme_changer_btn.dart';
import 'package:bmi_app/widgets/weight_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // theme controller
    ThemeController themeController = Get.put(ThemeController());

    // bmi controller
    BmiController bmiController = Get.put(BmiController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const ThemeChangerBtn(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // heading
                  Text(
                    "BMI Calculator",
                    style: TextStyle(
                      fontSize: 32,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // buttons
              Row(
                children: [
                  PrimaryButton(
                    onPress: () {
                      bmiController.genderHandler("MALE");
                    },
                    icon: Icons.male,
                    btnName: "MALE",
                  ),
                  const SizedBox(width: 15),
                  PrimaryButton(
                    onPress: () {
                      bmiController.genderHandler("FEMALE");
                    },
                    icon: Icons.female,
                    btnName: "FEMALE",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // height, age, weight details
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*
                    Here, we wrap the both widgets with expanded because we have to divide the space equally.
                     */
                    // left column
                    // selecting height in Cm's
                    HeightSelector(),
                    SizedBox(width: 15),
                    // right column
                    Expanded(
                      child: Column(
                        children: [
                          // select weight in Kg's
                          WeightSelector(),
                          SizedBox(height: 25),
                          AgeSelector(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // submit button
              MyRactButton(
                onPress: () {
                  bmiController.calculateBMI();
                  Get.to(const ResultScreen());
                },
                btnName: "CALCULATE",
                icon: Icons.done,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
