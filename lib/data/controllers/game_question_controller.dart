import 'package:dadagiri_admin_panel/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameQuizController extends GetxController {
  RxString currentSelectedRoundName = "".obs;
  RxString question = "".obs;
  RxString correctAnser = "".obs;
  RxString wrongAnswer = "".obs;

  addQuestion(BuildContext context) {
    if (_isInputValidationPassed()) {
    } else {
      return FailedToast().showErrorSnackbar(
          MediaQuery.of(context).size.width - 100, "Invalid Data Entered");
    }
  }

  bool _isInputValidationPassed() {
    return !(currentSelectedRoundName.isEmpty ||
        question.value.trim().isEmpty ||
        correctAnser.value.trim().isEmpty ||
        wrongAnswer.value.trim().isEmpty);
  }
}
