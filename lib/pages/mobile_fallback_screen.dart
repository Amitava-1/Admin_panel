import 'package:dadagiri_admin_panel/widgets/app_background_container.dart';
import 'package:flutter/material.dart';

class MobileFallbackPage extends StatelessWidget {
  const MobileFallbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundImageContainer(
          imageName: "assets/images/appBackgroundTiger.png"),
    );
  }
}
