import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key, required this.onChange});
  final Function(String?) onChange;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      onChanged: widget.onChange,
      items: <String>['বাপি বাড়ি যা', 'কভার ড্রাইভ', 'গুগলি', 'পাওয়ার প্লে']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: const InputDecoration(
        labelText: "রাউন্ড সনাক্ত করুন",
        border: OutlineInputBorder(),
      ),
    );
  }
}
