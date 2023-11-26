import 'package:dadagiri_admin_panel/pages/add_question/add_question.dart';
import 'package:dadagiri_admin_panel/pages/add_round.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userID = TextEditingController();
  var passWord = TextEditingController();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "এডমিন লগইন",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff424242)),
              ),
              Container(
                height: 35,
              ),
              TextField(
                controller: userID,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  labelText: 'ইউজার আইডি লিখুন',
                ),
              ),
              Container(
                height: 20,
              ),
              TextField(
                obscureText: passwordVisible,
                controller: passWord,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'পাসওয়ার্ড লিখুন',
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
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
              ElevatedButton(
                onPressed: () {
                  String uID = userID.text;
                  String uPass = passWord.text;

                  print("User ID: $uID, Password: $uPass");

                  Get.to(() => const AddRound());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(500, 58),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('প্রবেশ করুন'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
