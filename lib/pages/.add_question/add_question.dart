import 'package:flutter/material.dart';
import 'package:dadagiri_admin_panel/pages/.add_question/widgets/dropdownButton.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  var AddQuestion = TextEditingController();
  var CorrectAns = TextEditingController();
  var WrongAns = TextEditingController();

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
              "Add Questions",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xff424242)),
            ),
            Container(
              height: 35,
            ),
            const dropDownButton(),
            Container(
              height: 20,
            ),
            TextField(
              controller: AddQuestion,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add Question',
              ),
            ),
            Container(
              height: 20,
            ),
            TextField(
              controller: CorrectAns,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Correct Answer',
              ),
            ),
            Container(
              height: 20,
            ),
            TextField(
              controller: WrongAns,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Wrong Answer',
              ),
            ),
            Container(
              height: 40,
            ),
            ElevatedButton(
              onPressed: (){
                // String SelR = dropdownValue,
                String AddQ = AddQuestion.text;
                String CAns = CorrectAns.text;
                String Wans = WrongAns.text;

                print("Round name: $SelR, Question: $AddQ, Correct answer: $CAns, Wrong answer: $Wans");

              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(500, 58),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Submit'),
            )
          ],
        ),
      ),
      ),
    );
  }
}