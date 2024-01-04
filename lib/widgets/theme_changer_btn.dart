import 'package:bmi_app/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ThemeChangerBtn extends StatelessWidget {
  const ThemeChangerBtn({super.key});

  @override
  Widget build(BuildContext context) {
    // theme controller
    ThemeController themeController = Get.put(ThemeController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {
              themeController.changeTheme();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/icons/lightMode.svg",
                  height: 25,
                  width: 25,
                  color: themeController.isDark.value == true
                      ? Theme.of(context).colorScheme.onSecondaryContainer
                      : Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 15),
                SvgPicture.asset(
                  "assets/icons/darkMode.svg",
                  height: 25,
                  width: 25,
                  color: themeController.isDark.value == true
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
