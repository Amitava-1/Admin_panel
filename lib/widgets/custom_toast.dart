import 'package:dadagiri_admin_panel/constants/colors.dart';
import 'package:dadagiri_admin_panel/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class FailedToast {
  SnackbarController showErrorSnackbar(double width, String errMsg) {
    return Get.showSnackbar(
      GetSnackBar(
        messageText: Center(
          child: CustomTextWidget(
            text: errMsg,
            textSize: 15,
            textColor: Colors.black,
          ),
        ),
        borderRadius: 12,
        maxWidth: width,
        backgroundGradient: const LinearGradient(
          colors: [Color(AppColors.LIGHT_AMBER), Color(AppColors.DEEP_AMBER)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
