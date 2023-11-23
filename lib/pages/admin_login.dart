import 'package:flutter/material.dart';

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
    void initState(){
      super.initState();
      passwordVisible = true;
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4eff5),
      body: Center(
        child: Container(
        width: 400,
        height: 550,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Admin Login",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xff424242)),
            ),
            Container(
              height: 35,
            ),
            TextField(
              controller: userID,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                labelText: 'Enter user ID',
              ),
            ),
            Container(
              height: 20,
            ),
            TextField(
              obscureText: passwordVisible,
              controller: passWord,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                labelText: 'Enter password',
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                  ? Icons.visibility
                  : Icons.visibility_off),
                  onPressed: (){
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                )
              ),
            ),
            Container(
              height: 40,
            ),
            ElevatedButton(
              onPressed: (){
                String uID = userID.text;
                String uPass = passWord.text;

                print("User ID: $uID, Password: $uPass");
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(500, 58),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Login'),
            )
          ],
        ),
      ),
      ),
    );
  }
}