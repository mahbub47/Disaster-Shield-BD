import 'package:disaster_shield_bd/utils/constants/colors.dart';
import 'package:disaster_shield_bd/utils/device/device_utility.dart';
import 'package:disaster_shield_bd/utils/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader {
  static openLoadingDialog(String text) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              width: DDeviceUtils.getScreenWidth(),
              height: DDeviceUtils.getScreenHeight(),
              color: DColors.light,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: DTextTheme.lightTextTheme.labelLarge,
                  ),
                  const CircularProgressIndicator(color: DColors.primary)
                ],
              ),
            )));
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
