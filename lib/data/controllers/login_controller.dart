import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:dadagiri_admin_panel/pages/admin_login.dart';
import 'package:dadagiri_admin_panel/pages/dashboard.dart';
import 'package:dadagiri_admin_panel/widgets/custom_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  RxString userId = "".obs;
  RxString password = "".obs;
  RxBool showLoadingAnimation = false.obs;
  static const String ADMIN_USERS_COLLECTION_NAME = "admin_users";
  RxString docId = "".obs;

  validateCredentials() async {
    showLoadingAnimation.value = true;
    update();
    if (userId.isEmpty ||
        userId.trim().length < 4 ||
        password.isEmpty ||
        password.trim().length != 6) {
      showLoadingAnimation.value = false;
      update();
      return FailedToast().showErrorSnackbar(300, "Invalid inputs");
    }
    if (_validateUserId(userId.trim())) {
      String hashedString =
          sha256.convert(utf8.encode(password.trim())).toString();

      try {
        UserCredential signInWithEmailAndPassword =
            await _firebaseAuth.signInWithEmailAndPassword(
                email: userId.value, password: hashedString);

        if (signInWithEmailAndPassword.user != null) {
          showLoadingAnimation.value = false;
          update();
          Get.offAll(() => const Dashboard());
        }
      } on FirebaseAuthException catch (ex) {
        showLoadingAnimation.value = false;
        update();
        return FailedToast().showErrorSnackbar(300, ex.code);
      }

      // if (_userData.size == 0) {
      //   showLoadingAnimation.value = false;
      //   update();
      //   return FailedToast()
      //       .showErrorSnackbar(300, "Incorrect User Id or Password.");
      // } else {
      //   showLoadingAnimation.value = false;
      //   for (var doc in _userData.docs) {
      //     docId.value = doc.id;
      //   }
      //   update();
      //   Get.offAll(() => const Dashboard());
      // }
    } else {
      showLoadingAnimation.value = false;
      update();
      return FailedToast().showErrorSnackbar(300, "Invalid userId");
    }
  }

  bool _validateUserId(String userId) {
    // RegExp regex = RegExp(r'^\d{4}$');
    // return regex.hasMatch(userId);
    return true;
  }

  logout() async {
    await _firebaseAuth.signOut();
    Get.offAll(() => const LoginScreen());
  }
}
