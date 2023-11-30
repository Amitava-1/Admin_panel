import 'package:dadagiri_admin_panel/constants/colors.dart';
import 'package:dadagiri_admin_panel/data/controllers/game_question_controller.dart';
import 'package:dadagiri_admin_panel/widgets/app_background_container.dart';
import 'package:dadagiri_admin_panel/widgets/buttons.dart';
import 'package:dadagiri_admin_panel/widgets/custom_text_widget.dart';
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

  @override
  void didChangeDependencies() {
    Navigator.of(context);
    super.didChangeDependencies();
  }

  Future getRoundList() async {
    await questionController.getRoundList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 2,
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
                    color: Colors.blue.shade100.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: GetBuilder<GameQuizController>(
                    builder: (_gameQuizControllerBuilder) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomTextWidget(
                        text: "প্রশ্ন নথিভুক্তিকরণ",
                        textSize: 28,
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
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(AppColors.DEEP_AMBER),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(AppColors.DEEP_AMBER),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          labelText: 'প্রশ্ন লিখুন',
                          labelStyle: const TextStyle(
                            color: Color(AppColors.DEEP_AMBER),
                          ),
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
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(AppColors.DEEP_AMBER),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(AppColors.DEEP_AMBER),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          labelText: 'সঠিক উত্তরটি লিখুন',
                          labelStyle: const TextStyle(
                            color: Color(AppColors.DEEP_AMBER),
                          ),
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
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(AppColors.DEEP_AMBER),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(AppColors.DEEP_AMBER),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          labelText: 'ভুল উত্তরটি লিখুন',
                          labelStyle: const TextStyle(
                            color: Color(AppColors.DEEP_AMBER),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      _gameQuizControllerBuilder.showLoadingAnimation.value
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              btnText: "জমা করুন",
                              gradientColor: const [
                                Color(AppColors.DEEP_AMBER),
                                Color(AppColors.LIGHT_AMBER),
                              ],
                              btnTextSize: 30,
                              btnTextColor:
                                  const Color(AppColors.PRIMARY_TEXT_COLOR),
                              btnHeight: 60,
                              onTap: () async {
                                questionController.addQuestion(context);
                              },
                            ),
                      // : ElevatedButton(
                      //     onPressed: () {
                      //       questionController.addQuestion(context);
                      //     },
                      //     child: const Text('জমা করুন'),
                      //   )
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
