import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dadagiri_admin_panel/data/models/game_rounds.dart';
import 'package:dadagiri_admin_panel/widgets/custom_toast.dart';

class RoundService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final ROUND_COLLECTION_NAME = "rounds";

  Future<List<String>> fetchRoundListAPI() async {
    List<String> roundListArr = [];
    QuerySnapshot roundList =
        await _firebaseFirestore.collection(ROUND_COLLECTION_NAME).get();
    if (roundList.docs.isEmpty) {
      return roundListArr;
    } else {
      for (var element in roundList.docs) {
        roundListArr.add(element.get("RoundName"));
      }
      return roundListArr;
    }
  }

  insertNewRoundAPI(GameRounds roundModel) async {
    try {
      DocumentReference insertRound = await _firebaseFirestore
          .collection(ROUND_COLLECTION_NAME)
          .add(roundModel.toJson());

      return FailedToast().showErrorSnackbar(300, "Submitted");
    } on FirebaseException catch (ex) {
      return FailedToast().showErrorSnackbar(300, ex.code);
    }
  }

  Future<bool> checkWhetherRoundExists(String roundName) async {
    QuerySnapshot roundData = await _firebaseFirestore
        .collection(ROUND_COLLECTION_NAME)
        .where("RoundName", isEqualTo: roundName.toUpperCase())
        .get();

    if (roundData.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  fetchRoundId(String roundName) async {
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection(ROUND_COLLECTION_NAME)
        .where("RoundName", isEqualTo: roundName.toUpperCase())
        .get();

    return querySnapshot.docs[0].id;
  }
}
