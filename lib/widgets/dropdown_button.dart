import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    required this.onChange,
    required this.dropDownItem,
  });
  final Function(String?) onChange;
  final List<DropdownMenuItem<String>> dropDownItem;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      onChanged: widget.onChange,
      items: widget.dropDownItem,
      decoration: const InputDecoration(
        labelText: "রাউন্ড সনাক্ত করুন",
        border: OutlineInputBorder(),
      ),
    );
  }
}
