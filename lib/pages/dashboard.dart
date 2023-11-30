import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dadagiri_admin_panel/constants/colors.dart';
import 'package:dadagiri_admin_panel/data/controllers/login_controller.dart';
import 'package:dadagiri_admin_panel/pages/add_question/add_question.dart';
import 'package:dadagiri_admin_panel/pages/add_round.dart';
import 'package:dadagiri_admin_panel/pages/home.dart';
import 'package:dadagiri_admin_panel/widgets/app_background_container.dart';
import 'package:dadagiri_admin_panel/widgets/buttons.dart';
import 'package:dadagiri_admin_panel/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Widget> pageList = [
    const Home(),
    const AddRound(),
    const AddQuestion()
  ];
  final List<String> collectionList = ["rounds", "question"];
  final _firebaseFirestore = FirebaseFirestore.instance;
  final LoginController _loginController = Get.put(LoginController());
  int currentIndex = 0;

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
        body: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(flex: 2, child: pageList[currentIndex]),
            currentIndex != 0
                ? Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80, right: 30),
                      child: Container(
                        height: MediaQuery.of(context).size.height - 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: StreamBuilder(
                            stream: currentIndex == 1
                                ? _firebaseFirestore
                                    .collection("rounds")
                                    .snapshots()
                                : _firebaseFirestore
                                    .collection("questions")
                                    .orderBy("RoundName")
                                    .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: currentIndex == 1
                                            ? ListTile(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                tileColor: const Color(AppColors
                                                    .LEADERBOARD_RANK_3_SECONDARY_COLOR),
                                                title: CustomTextWidget(
                                                  text: snapshot.data!
                                                      .docs[index]["RoundName"],
                                                  textSize: 20,
                                                  textColor: Colors.black,
                                                ),
                                                subtitle: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "Round Position: ${snapshot.data!.docs[index]["RoundPosition"]}"),
                                                    Text(
                                                        "Incorrect Option Point: ${snapshot.data!.docs[index]["RoundNegativeScore"]}"),
                                                    Text(
                                                        "Correct Option Point: ${snapshot.data!.docs[index]["RoundPositiveScore"]}"),
                                                  ],
                                                ),
                                              )
                                            : ListTile(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                tileColor: const Color(AppColors
                                                    .LEADERBOARD_RANK_3_SECONDARY_COLOR),
                                                title: Text(snapshot.data!
                                                    .docs[index]["Question"]),
                                                subtitle: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "Correct Answer: ${snapshot.data!.docs[index]["CorrectAnswer"]}"),
                                                    Text(
                                                        "Incorrect Answer: ${snapshot.data!.docs[index]["IncorrectAnswer"]}"),
                                                    Text(
                                                        "RoundName: ${snapshot.data!.docs[index]["RoundName"]}"),
                                                  ],
                                                ),
                                              ),
                                      );
                                    },
                                  );
                                } else {
                                  return const Center(
                                    child: Text("No Data Found"),
                                  );
                                }
                              } else {
                                return const Center(
                                  child: Text("No Data Found"),
                                );
                              }
                            }),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  child: BackgroundImageContainer(
                    imageName: "assets/images/appLogo.png",
                    height: 60,
                    width: 80,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      child: CustomTextWidget(
                        text: "Home",
                        textSize: 20,
                        textColor: currentIndex != 0
                            ? const Color(AppColors.PRIMARY_TEXT_COLOR)
                            : Colors.white,
                        fontWeight: currentIndex != 0
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(width: 30),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 1;
                        });
                      },
                      child: CustomTextWidget(
                        text: "Rounds",
                        textSize: 20,
                        textColor: currentIndex != 1
                            ? const Color(AppColors.PRIMARY_TEXT_COLOR)
                            : Colors.white,
                        fontWeight: currentIndex != 1
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(width: 30),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          currentIndex = 2;
                        });
                      },
                      child: CustomTextWidget(
                        text: "Question",
                        textSize: 20,
                        textColor: currentIndex != 2
                            ? const Color(AppColors.PRIMARY_TEXT_COLOR)
                            : Colors.white,
                        fontWeight: currentIndex != 2
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(width: 30),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: CustomTextWidget(
                    //     text: "Users",
                    //     textSize: 20,
                    //     textColor: currentIndex != 3
                    //         ? const Color(AppColors.PRIMARY_TEXT_COLOR)
                    //         : Colors.white,
                    //     fontWeight: currentIndex != 3
                    //         ? FontWeight.w600
                    //         : FontWeight.normal,
                    //   ),
                    // ),
                    // const SizedBox(width: 30),

                    CustomButton(
                      onTap: () {
                        _loginController.logout();
                        setState(() {});
                      },
                      btnText: "LOGOUT",
                      gradientColor: [
                        const Color(AppColors.DEEP_AMBER),
                        const Color(AppColors.LIGHT_AMBER)
                      ],
                      btnTextSize: 15,
                      btnTextColor: const Color(
                        AppColors.PRIMARY_TEXT_COLOR,
                      ),
                      btnHeight: 40,
                      btnWidth: 100,
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      ),
    );
  }
}
