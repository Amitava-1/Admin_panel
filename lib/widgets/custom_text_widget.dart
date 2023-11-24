import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.textColor,
    required this.textSize,
    this.fontWeight,
  });
  final String text;
  final Color? textColor;
  final double textSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? Colors.white,
        fontSize: textSize,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

// class CustomTextWithImageWidget extends StatelessWidget {
//   const CustomTextWithImageWidget({
//     super.key,
//     required this.text,
//     this.textColor,
//     required this.textSize,
//     this.fontWeight,
//     required this.asset,
//     required this.imgHeight,
//     required this.imgWidth,
//     required this.boxFit,
//   });
//   final String text;
//   final Color? textColor;
//   final double textSize;
//   final FontWeight? fontWeight;
//   final String asset;
//   final double imgHeight;
//   final double imgWidth;
//   final BoxFit boxFit;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           text,
//           style: TextStyle(
//             color: textColor ?? Colors.white,
//             fontSize: textSize,
//             fontWeight: fontWeight ?? FontWeight.normal,
//           ),
//         ),
//         const SizedBox(
//           width: 5,
//         ),
//         BackgroundImageContainer(
//           imageName: asset,
//           height: imgHeight,
//           width: imgWidth,
//           imageFit: boxFit,
//         )
//       ],
//     );
//   }
// }

class CustomTextWithIcon extends StatelessWidget {
  const CustomTextWithIcon({
    super.key,
    required this.text,
    this.textColor,
    required this.textSize,
    this.fontWeight,
    required this.icon,
    required this.iconSize,
  });
  final String text;
  final Color? textColor;
  final double textSize;
  final FontWeight? fontWeight;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: textSize,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Icon(
          icon,
          size: iconSize,
          color: textColor,
        ),
      ],
    );
  }
}
