import 'package:flutter/material.dart';

class dropDownButton extends StatefulWidget {
  const dropDownButton({super.key});

  @override
  State<dropDownButton> createState() => _dropDownButtonState();
}

class _dropDownButtonState extends State<dropDownButton> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Toss', 'Googly', 'Rapid fire']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: const InputDecoration(
        
        labelText: "Select Round",
        border: OutlineInputBorder(),
      ),
    );
  }
}