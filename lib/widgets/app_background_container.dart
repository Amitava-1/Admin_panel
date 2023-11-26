import 'package:flutter/material.dart';

//This class is used to set the background image of the page.
class BackgroundImageContainer extends StatelessWidget {
  const BackgroundImageContainer({
    super.key,
    required this.imageName,
    this.height,
    this.width,
    this.imageFit,
  });

  final String imageName;
  final double? height;
  final double? width;
  final BoxFit? imageFit;

  @override
  Widget build(BuildContext context) {
    return Image(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height,
      fit: imageFit ?? BoxFit.fill,
      image: AssetImage(imageName),
    );
  }
}
