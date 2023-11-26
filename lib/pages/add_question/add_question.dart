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
  void initState() {
    // TODO: implement initState
    super.initState();
    getRoundList();
  }

  Future getRoundList() async {
    await questionController.getRoundList();
  }

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
                  "প্রশ্ন নথিভুক্তিকরণ",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff424242)),
                ),
                const SizedBox(
                  height: 35,
                ),

                //Dropdown field to capture the Rounds.
                CustomDropDownButton(
                  dropDownItem: _gameQuizControllerBuilder.roundList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChange: (dropDownSelectedValue) {
                    questionController.currentSelectedRoundName.value =
                        dropDownSelectedValue!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // TextField to capture the question.
                TextField(
                  onChanged: (value) {
                    questionController.question.value = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'প্রশ্ন লিখুন',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Textfield to capture the correctAnswer
                TextField(
                  onChanged: (value) {
                    questionController.correctAnswer.value = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'সঠিক উত্তরটি লিখুন',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Textfield to capture the wrong answer.
                TextField(
                  onChanged: (value) {
                    questionController.wrongAnswer.value = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ভুল উত্তরটি লিখুন',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                _gameQuizControllerBuilder.showLoadingAnimation.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          questionController.addQuestion(context);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 58),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text('জমা করুন'),
                      )
              ],
            );
          }),
        ),
      ),
    );
  }
}
