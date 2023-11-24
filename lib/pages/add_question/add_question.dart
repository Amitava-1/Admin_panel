import 'package:dadagiri_admin_panel/data/controllers/game_question_controller.dart';
import 'package:dadagiri_admin_panel/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final questionController = Get.put(GameQuizController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe4eff5),
      body: Center(
        child: Container(
          width: 400,
          height: 550,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: GetBuilder<GameQuizController>(
              builder: (_gameQuizControllerBuilder) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Add Questions",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff424242)),
                ),
                Container(
                  height: 35,
                ),
                CustomDropDownButton(
                  onChange: (dropDownSelectedValue) {
                    questionController.currentSelectedRoundName.value =
                        dropDownSelectedValue!;
                  },
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    questionController.question.value = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add Question',
                  ),
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    questionController.correctAnser.value = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correct Answer',
                  ),
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    questionController.wrongAnswer.value = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Wrong Answer',
                  ),
                ),
                Container(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    _gameQuizControllerBuilder.addQuestion(context);
                    print(
                        "Question: ${_gameQuizControllerBuilder.question}, Correct answer: ${_gameQuizControllerBuilder.correctAnser}, Wrong answer: ${_gameQuizControllerBuilder.wrongAnswer}");
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(500, 58),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('Submit'),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
