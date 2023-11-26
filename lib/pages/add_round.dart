import 'package:dadagiri_admin_panel/pages/add_question/add_question.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:dadagiri_admin_panel/data/controllers/game_round_controller.dart';
import 'package:flutter/material.dart';
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
          child: GetBuilder<GameRoundsController>(
              builder: (_gameRoundsControllerBuilder) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "রাউন্ড নথিভুক্তিকরণ",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff424242)),
                ),
                Container(
                  height: 35,
                ),
                TextField(
                  controller: _roundNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'রাউন্ডের নাম লিখুন',
                  ),
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  controller: _roundNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'রাউন্ড সংখ্যা লিখুন',
                  ),
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  controller: _roundPositiveScoreController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'যুক্ত নম্বরের পরিমাণ',
                  ),
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  controller: _roundNegativeScoreController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'বিযুক্ত নম্বরের পরিমাণ',
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
                    : ElevatedButton(
                        onPressed: () async {
                          _gameRoundsController.roundName.value =
                              _roundNameController.text;
                          _gameRoundsController.roundPosition.value =
                              int.parse(_roundNumberController.text);
                          _gameRoundsController.roundNegativeScore.value =
                              int.parse(_roundNegativeScoreController.text);
                          _gameRoundsController.roundPositiveScore.value =
                              int.parse(_roundPositiveScoreController.text);
                          await _gameRoundsController.addRound();
                          _roundNameController.clear();
                          _roundNumberController.clear();
                          _roundNegativeScoreController.clear();
                          _roundPositiveScoreController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          // minimumSize: Size(500, 58),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text('জমা দিন'),
                      )
              ],
            );
          }),
        ),
      ),
    );
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Text(
    //           "রাউন্ড নথিভুক্তিকরণ",
    //         style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xff424242)),
    //         ),
    //         Container(
    //           height: 35,
    //         ),
    //         TextField(
    //           controller: RoundName,
    //           decoration: const InputDecoration(
    //             border: OutlineInputBorder(),
    //             labelText: 'রাউন্ডের নাম লিখুন',
    //           ),
    //         ),
    //         Container(
    //           height: 20,
    //         ),
    //         TextField(
    //           controller: RoundNumber,
    //           decoration: InputDecoration(
    //             border: OutlineInputBorder(),
    //             labelText: 'রাউন্ড সংখ্যা লিখুন',
    //           ),
    //         ),
    //         Container(
    //           height: 20,
    //         ),
    //         TextField(
    //           controller: PlusMark,
    //           decoration: InputDecoration(
    //             border: OutlineInputBorder(),
    //             labelText: 'যুক্ত নম্বরের পরিমাণ',
    //           ),
    //         ),
    //         Container(
    //           height: 20,
    //         ),
    //         TextField(
    //           controller: MinusMark,
    //           decoration: InputDecoration(
    //             border: OutlineInputBorder(),
    //             labelText: 'বিযুক্ত নম্বরের পরিমাণ',
    //           ),
    //         ),
    //         Container(
    //           height: 40,
    //         ),
    //         ElevatedButton(
    //           onPressed: (){
    //             String Rname = RoundName.text;
    //             String Rnumber = RoundNumber.text;
    //             String Pmark = PlusMark.text;
    //             String Nmark = MinusMark.text;

    //             print("Round name: $Rname, Round number: $Rnumber, Positive marking: $Pmark, Negative marking: $Nmark");

    //             Get.to(() => const AddQuestion());

    //           },
    //           style: ElevatedButton.styleFrom(
    //             minimumSize: Size(500, 58),
    //             textStyle: const TextStyle(fontSize: 20),
    //           ),
    //           child: const Text('জমা দিন'),
    //         )
    //       ],
    //     ),
    //   ),
    //   ),
    // );
  }
}
