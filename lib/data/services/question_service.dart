import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dadagiri_admin_panel/data/models/game_question.dart';
import 'package:dadagiri_admin_panel/widgets/custom_toast.dart';

class QuestionService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  addQuestionAPI(
      String questionSubCollectionName, GameQuestion gameQuestionModel) async {
    try {
      DocumentReference insertedQuestion = await _firebaseFirestore
          .collection("questions")
          .add(gameQuestionModel.toJson());

      return FailedToast().showErrorSnackbar(300, "Submitted");
    } on FirebaseException catch (ex) {
      return FailedToast().showErrorSnackbar(300, ex.code);
    }
  }
}
