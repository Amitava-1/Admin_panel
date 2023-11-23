import 'package:dadagiri_admin_panel/pages/.add_question/add_question.dart';
import 'package:dadagiri_admin_panel/pages/add_round.dart';
import 'package:dadagiri_admin_panel/pages/admin_login.dart';
import 'package:dadagiri_admin_panel/pages/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const LoginScreen(),
      // home: const Dashboard(),
      // home: const AddRound(),
      home: const AddQuestion(),

    );
  }
}

