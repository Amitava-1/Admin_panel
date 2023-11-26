import 'package:dadagiri_admin_panel/data/controllers/game_question_controller.dart';
import 'package:dadagiri_admin_panel/widgets/app_background_container.dart';
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
    super.initState();
    getRoundList();
  }

  Future getRoundList() async {
    await questionController.getRoundList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/inAppBackgroundImage.png"),
            fit: BoxFit.fitWidth),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: BackgroundImageContainer(
                imageName: "assets/images/DadagiriWatermark.png",
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
            Center(
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
                          labelText: 'Add Question',
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
                          labelText: 'Correct Answer',
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
                          labelText: 'Wrong Answer',
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      _gameQuizControllerBuilder.showLoadingAnimation.value
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                questionController.addQuestion(context);
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
          ],
        ),
      ),
    );
  }
}
