import 'package:dadagiri_admin_panel/data/models/game_question.dart';
import 'package:dadagiri_admin_panel/data/services/question_service.dart';
import 'package:dadagiri_admin_panel/data/services/round_service.dart';
import 'package:dadagiri_admin_panel/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameQuizController extends GetxController {
  final RoundService _roundService = RoundService();
  final QuestionService _questionService = QuestionService();

  RxString currentSelectedRoundName = "".obs;
  RxString question = "".obs;
  RxString correctAnswer = "".obs;
  RxString wrongAnswer = "".obs;
  RxList<String> roundList = [""].obs;
  RxBool showLoadingAnimation = false.obs;

  addQuestion(BuildContext context) async {
    showLoadingAnimation.value = true;
    update();
    if (_isInputValidationPassed()) {
      String subCollectionName =
          await _roundService.fetchRoundId(currentSelectedRoundName.value);

      subCollectionName =
          "${"rounds/$subCollectionName/${currentSelectedRoundName.value}"}Round";

      GameQuestion gameQuestionModel = GameQuestion(
          question: question.value,
          correctAnswer: correctAnswer.value,
          wrongAnswer: wrongAnswer.value);

      await _questionService.addQuestionAPI(
          subCollectionName, gameQuestionModel);
      showLoadingAnimation.value = false;
      update();
    } else {
      showLoadingAnimation.value = false;
      update();
      return FailedToast().showErrorSnackbar(300, "Invalid Data Entered");
    }
  }

  getRoundList() async {
    roundList.value = await _roundService.fetchRoundListAPI();
    update();
  }

  bool _isInputValidationPassed() {
    return !(currentSelectedRoundName.isEmpty ||
        question.value.trim().isEmpty ||
        correctAnswer.value.trim().isEmpty ||
        wrongAnswer.value.trim().isEmpty);
  }
}
