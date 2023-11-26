import 'package:dadagiri_admin_panel/constants/colors.dart';
import 'package:flutter/material.dart';

//This class will create a loader based on the text provided.
class BasicLoader extends StatefulWidget {
  const BasicLoader({
    super.key,
    this.height,
    this.progress,
    this.width,
    required this.loaderText,
  });
  final double? height;
  final double? progress;
  final double? width;
  final String loaderText;

  @override
  State<BasicLoader> createState() => _BasicLoaderState();
}

class _BasicLoaderState extends State<BasicLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color(AppColors.LIGHT_AMBER),
          ),
          bottom: BorderSide(
            width: 1,
            color: Color(AppColors.LIGHT_AMBER),
          ),
          left: BorderSide(
            width: 1,
            color: Color(AppColors.LIGHT_AMBER),
          ),
          right: BorderSide(
            width: 1,
            color: Color(AppColors.LIGHT_AMBER),
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: widget.height,
            width: widget.width! * widget.progress!,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(AppColors.LIGHT_AMBER),
                Color(AppColors.DEEP_AMBER),
              ]),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Text(widget.loaderText),
            ),
          ),
        ],
      ),
    );
  }
}
