import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dadagiri_admin_panel/data/models/game_rounds.dart';
import 'package:dadagiri_admin_panel/data/services/round_service.dart';
import 'package:dadagiri_admin_panel/widgets/custom_toast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GameRoundsController extends GetxController {
  final RoundService _roundService = RoundService();

  RxString roundName = "".obs;
  RxInt roundPosition = 0.obs;
  RxInt roundNegativeScore = 0.obs;
  RxInt roundPositiveScore = 0.obs;
  RxBool showLoadingAnimation = false.obs;

  addRound() async {
    showLoadingAnimation.value = true;
    update();
    if (await _roundService.checkWhetherRoundExists(roundName.value)) {
      showLoadingAnimation.value = false;
      update();
      return FailedToast()
          .showErrorSnackbar(300, "Round: $roundName already exists.");
    } else {
      GameRounds roundModel = GameRounds(
        roundName: roundName.value.toUpperCase(),
        roundNegativeScore: roundNegativeScore.value,
        roundPosition: roundPosition.value,
        roundPositiveScore: roundPositiveScore.value,
      );

      _roundService.insertNewRoundAPI(roundModel);
      showLoadingAnimation.value = false;
      update();
    }
  }
}
