import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiController extends GetxController {
  // gender
  // here we are matching the button name
  // make sure it is in the correct alplabetical order
  RxString currentGender = "MALE".obs;

  // weight controller
  RxInt weight = 30.obs;

  // age controller
  RxInt age = 18.obs;

  // height controller
  RxDouble height = 100.0.obs;

  // bmi value
  RxDouble bmi = 0.0.obs;

  // result
  RxString bmiStatus = "".obs;

  // colors
  Rx<Color> colorStatus = const Color(0xff246afe).obs;

  // gender handler function
  void genderHandler(String gender) {
    currentGender.value = gender;
  }

  void calculateBMI() {
    // convert the height in meters
    var heightInMeters = height / 100;
    //print(heightInMeters);

    // calculate and update the BMI
    bmi.value = weight / (heightInMeters * heightInMeters);

    // final bmi status
    finalStatus();
  }

  // final bmi status
  void finalStatus() {
    if (bmi.value < 18.5) {
      bmiStatus.value = "UnderWeight";
      colorStatus.value = const Color(0xffff8800);
    }
    if (bmi.value > 18.5 && bmi.value < 24.9) {
      bmiStatus.value = "Normal";
      colorStatus.value = const Color(0xff00ca39);
    }
    if (bmi.value > 25.0 && bmi.value < 29.9) {
      bmiStatus.value = "OverWeight";
      colorStatus.value = const Color(0xffff5858);
    }
    if (bmi.value > 30.0 && bmi.value < 34.9) {
      bmiStatus.value = "Obese";
      colorStatus.value = const Color(0xffff0000);
    }
    if (bmi.value > 35.0) {
      bmiStatus.value = "Extremely Obese";
      colorStatus.value = const Color(0xFF937373);
    }
  }
}
