import 'package:dadagiri_admin_panel/constants/colors.dart';
import 'package:dadagiri_admin_panel/data/controllers/login_controller.dart';
import 'package:dadagiri_admin_panel/pages/dashboard.dart';
import 'package:dadagiri_admin_panel/widgets/app_background_container.dart';
import 'package:dadagiri_admin_panel/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
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
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 30,
                  top: 10,
                ),
                decoration: BoxDecoration(
                    color: Colors.blue.shade100.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: GetBuilder<LoginController>(
                    builder: (_loginControllerBulderState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const BackgroundImageContainer(
                        imageName: "assets/images/appLogo.png",
                        height: 100,
                        width: 120,
                        imageFit: BoxFit.fill,
                      ),
                      const SizedBox(height: 35),
                      const Text(
                        "Admin Login",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(AppColors.PRIMARY_TEXT_COLOR),
                        ),
                      ),
                      Container(
                        height: 35,
                      ),
                      TextField(
                        onChanged: (value) {
                          _loginController.userId.value = value.trim();
                        },
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(AppColors.DEEP_AMBER),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(AppColors.DEEP_AMBER),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          labelText: 'Enter user ID',
                          labelStyle: TextStyle(
                            color: Color(AppColors.DEEP_AMBER),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          _loginController.password.value = value.trim();
                        },
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
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
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.white),
                            labelText: 'Enter password',
                            labelStyle: const TextStyle(
                              color: Color(AppColors.DEEP_AMBER),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(AppColors.DEEP_AMBER),
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            )),
                      ),
                      Container(
                        height: 40,
                      ),
                      _loginController.showLoadingAnimation.value
                          ? CircularProgressIndicator()
                          : GestureDetector(
                              onTap: () {
                                _loginController.validateCredentials();
                                // Get.offAll(() => const Dashboard());
                              },
                              child: Container(
                                height: 40,
                                width: 200,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(
                                            AppColors.SECONDARY_TEXT_COLOR),
                                        offset: Offset(1, 1),
                                        blurRadius: 10,
                                        spreadRadius: 2)
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(AppColors.DEEP_AMBER),
                                      Color(AppColors.LIGHT_AMBER),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: const Center(
                                  child: CustomTextWidget(
                                    text: "LOGIN",
                                    textSize: 20,
                                    fontWeight: FontWeight.w600,
                                    textColor:
                                        Color(AppColors.PRIMARY_TEXT_COLOR),
                                  ),
                                ),
                              ),
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
