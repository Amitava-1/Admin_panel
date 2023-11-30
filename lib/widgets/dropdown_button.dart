import 'package:dadagiri_admin_panel/constants/colors.dart';
import 'package:flutter/material.dart';

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
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.3),
        filled: true,
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
        labelText: "রাউন্ড সনাক্ত করুন",
        labelStyle: const TextStyle(
          color: Color(AppColors.DEEP_AMBER),
        ),
      ),
    );
  }
}
