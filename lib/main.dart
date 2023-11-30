import 'package:dadagiri_admin_panel/data/controllers/login_controller.dart';
import 'package:dadagiri_admin_panel/firebase_options.dart';
import 'package:dadagiri_admin_panel/pages/admin_login.dart';
import 'package:dadagiri_admin_panel/pages/dashboard.dart';
import 'package:dadagiri_admin_panel/pages/mobile_fallback_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAuth.instance.setPersistence(Persistence.SESSION);
  User? currentUser = FirebaseAuth.instance.currentUser;
  runApp(MyApp(
    user: currentUser,
  ));
}

class MyApp extends StatelessWidget {
  final _loginController = Get.put(LoginController());
  final User? user;
  MyApp({super.key, required this.user});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dadagiri Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: !kIsWeb
          ? const MobileFallbackPage()
          : user == null
              ? const LoginScreen()
              : const Dashboard(),
      // home: const Dashboard(),
    );
  }
}
