import 'package:dadagiri_admin_panel/constants/colors.dart';
import 'package:dadagiri_admin_panel/widgets/app_background_container.dart';
import 'package:dadagiri_admin_panel/widgets/buttons.dart';
import 'package:dadagiri_admin_panel/widgets/custom_text_widget.dart';
import 'package:dadagiri_admin_panel/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:dadagiri_admin_panel/data/controllers/game_round_controller.dart';
import 'package:get/get.dart';

class AddRound extends StatefulWidget {
  const AddRound({super.key});

  @override
  State<AddRound> createState() => _AddRoundState();
}

class _AddRoundState extends State<AddRound> {
  final GameRoundsController _gameRoundsController =
      Get.put(GameRoundsController());

  final TextEditingController _roundNameController = TextEditingController();
  final TextEditingController _roundNumberController = TextEditingController();
  final TextEditingController _roundPositiveScoreController =
      TextEditingController();
  final TextEditingController _roundNegativeScoreController =
      TextEditingController();

  @override
  void didChangeDependencies() {
    Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: BackgroundImageContainer(
                imageName: "assets/images/DadagiriWatermark.png",
                width: MediaQuery.of(context).size.width,
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
                child: GetBuilder<GameRoundsController>(
                    builder: (_gameRoundsControllerBuilder) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomTextWidget(
                        text: "রাউন্ড নথিভুক্তিকরণ",
                        textSize: 28,
                      ),
                      Container(
                        height: 35,
                      ),
                      TextField(
                        controller: _roundNameController,
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
                          labelText: 'রাউন্ডের নাম লিখুন',
                          labelStyle: const TextStyle(
                            color: Color(AppColors.DEEP_AMBER),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      TextField(
                        controller: _roundNumberController,
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
                          labelText: 'রাউন্ড সংখ্যা লিখুন',
                          labelStyle: const TextStyle(
                            color: Color(AppColors.DEEP_AMBER),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      TextField(
                        controller: _roundPositiveScoreController,
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
                          labelText: 'যুক্ত নম্বরের পরিমাণ',
                          labelStyle: const TextStyle(
                            color: Color(AppColors.DEEP_AMBER),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      TextField(
                        controller: _roundNegativeScoreController,
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
                          labelText: 'বিযুক্ত নম্বরের পরিমাণ',
                          labelStyle: const TextStyle(
                            color: Color(AppColors.DEEP_AMBER),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                      ),
                      _gameRoundsControllerBuilder.showLoadingAnimation.value
                          ? const SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              btnText: "জমা দিন",
                              gradientColor: const [
                                Color(AppColors.DEEP_AMBER),
                                Color(AppColors.LIGHT_AMBER),
                              ],
                              btnTextSize: 30,
                              btnTextColor:
                                  const Color(AppColors.PRIMARY_TEXT_COLOR),
                              btnHeight: 60,
                              onTap: () async {
                                if (_roundNameController.text.isEmpty ||
                                    _roundNegativeScoreController
                                        .text.isEmpty ||
                                    _roundNumberController.text.isEmpty ||
                                    _roundPositiveScoreController
                                        .text.isEmpty) {
                                  return FailedToast().showErrorSnackbar(
                                      300, "Please Enter value in all Fields.");
                                } else {
                                  _gameRoundsController.roundName.value =
                                      _roundNameController.text;
                                  _gameRoundsController.roundPosition.value =
                                      int.parse(_roundNumberController.text);
                                  _gameRoundsController
                                          .roundNegativeScore.value =
                                      int.parse(
                                          _roundNegativeScoreController.text);
                                  _gameRoundsController
                                          .roundPositiveScore.value =
                                      int.parse(
                                          _roundPositiveScoreController.text);
                                  await _gameRoundsController.addRound();
                                  _roundNameController.clear();
                                  _roundNumberController.clear();
                                  _roundNegativeScoreController.clear();
                                  _roundPositiveScoreController.clear();
                                }
                              },
                            ),
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
