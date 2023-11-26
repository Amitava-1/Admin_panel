import 'package:dadagiri_admin_panel/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: CustomTextWidget(
                text: "text",
                textSize: 12,
                textColor: Colors.black,
              ),
              accountEmail: CustomTextWidget(
                text: "text",
                textSize: 12,
                textColor: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: const CustomTextWidget(
                  text: "Home",
                  textSize: 15,
                  textColor: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: const CustomTextWidget(
                  text: "Add Rounds",
                  textSize: 15,
                  textColor: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: const CustomTextWidget(
                  text: "Add Questions",
                  textSize: 15,
                  textColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('ড্যাশবোর্ড'),
      ),
    );
  }
}
