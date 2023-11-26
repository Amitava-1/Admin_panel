import 'package:dadagiri_admin_panel/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.btnText,
      required this.gradientColor,
      required this.btnTextSize,
      required this.btnTextColor,
      required this.btnHeight,
      required this.onTap,
      this.btnWidth});

  final String btnText;
  final List<Color> gradientColor;
  final double btnTextSize;
  final Color btnTextColor;
  final double btnHeight;
  final Function() onTap;
  final double? btnWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? MediaQuery.of(context).size.width - 100,
        height: btnHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Center(
          child: CustomTextWidget(
            text: btnText,
            textSize: btnTextSize,
            textColor: btnTextColor,
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithImage extends StatelessWidget {
  const CustomButtonWithImage({
    super.key,
    required this.btnText,
    required this.gradientColor,
    required this.btnTextSize,
    required this.btnTextColor,
    required this.btnHeight,
    required this.onTap,
    this.btnWidth,
    required this.asset,
    required this.imgHeight,
    required this.imgWidth,
    required this.boxFit,
  });

  final String btnText;
  final List<Color> gradientColor;
  final double btnTextSize;
  final Color btnTextColor;
  final double btnHeight;
  final Function() onTap;
  final double? btnWidth;
  final String asset;
  final double imgHeight;
  final double imgWidth;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? MediaQuery.of(context).size.width - 100,
        height: btnHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Center(
          child: CustomTextWithImageWidget(
            text: btnText,
            textSize: btnTextSize,
            textColor: btnTextColor,
            asset: asset,
            imgHeight: imgHeight,
            imgWidth: imgHeight,
            boxFit: boxFit,
          ),
        ),
      ),
    );
  }
}


class CustomButtonWithIcons extends StatelessWidget {
  const CustomButtonWithIcons({
    super.key,
    required this.btnText,
    required this.gradientColor,
    required this.btnTextSize,
    required this.btnTextColor,
    required this.btnHeight,
    required this.onTap,
    this.btnWidth,
    required this.icon,
    required this.iconSize,
  });

  final String btnText;
  final List<Color> gradientColor;
  final double btnTextSize;
  final Color btnTextColor;
  final double btnHeight;
  final Function() onTap;
  final double? btnWidth;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? MediaQuery.of(context).size.width - 100,
        height: btnHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Center(
          child: CustomTextWithIcon(
            text: btnText,
            textSize: btnTextSize,
            textColor: btnTextColor,
            icon: icon,
            iconSize: btnHeight,
          ),
        ),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton(
      {super.key,
      required this.btnText,
      required this.gradientColor,
      required this.btnTextSize,
      required this.btnTextColor,
      required this.btnHeight,
      required this.onTap,
      this.btnWidth,
      this.borderColor,
      this.imageName});

  final String btnText;
  final List<Color> gradientColor;
  final double btnTextSize;
  final Color btnTextColor;
  final double btnHeight;
  final Function() onTap;
  final double? btnWidth;
  final Color? borderColor;
  final String? imageName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? MediaQuery.of(context).size.width - 100,
        height: btnHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border(
            top: BorderSide(
              color: borderColor ?? Colors.white,
              width: 1,
            ),
            bottom: BorderSide(
              color: borderColor ?? Colors.white,
              width: 1,
            ),
            left: BorderSide(
              color: borderColor ?? Colors.white,
              width: 1,
            ),
            right: BorderSide(
              color: borderColor ?? Colors.white,
              width: 1,
            ),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Center(
          child: imageName != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      imageName!,
                      height: 25,
                      width: 25,
                    ),
                    CustomTextWidget(
                      text: btnText,
                      textSize: btnTextSize,
                      textColor: btnTextColor,
                    ),
                  ],
                )
              : CustomTextWidget(
                  text: btnText,
                  textSize: btnTextSize,
                  textColor: btnTextColor,
                ),
        ),
      ),
    );
  }
}
