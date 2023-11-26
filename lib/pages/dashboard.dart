import 'package:dadagiri_admin_panel/pages/add_question/add_question.dart';
import 'package:dadagiri_admin_panel/pages/add_round.dart';
import 'package:dadagiri_admin_panel/widgets/app_background_container.dart';
import 'package:flutter/material.dart';
import 'package:ruki_nav_bar/ruki_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Widget> pageList = [const AddRound(), const AddQuestion()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/inAppBackgroundImage.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: SiteNavBar.get(
              // currentSelected: currentIndex,
              body: PageView(
                children: pageList,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              indicatorLineThickness: 4,
              backgroundColor: Colors.transparent,
              drawerMode: NavDrawerMode.full,
              pageIndicator: PageIndicator.line,
              itemPosition: NavItemPosition.right,
              leading: const BackgroundImageContainer(
                imageName: "assets/images/appLogo.png",
                height: 50,
                width: 70,
              ),
              navItemSpacing: 8,
              navItems: [
                NavItem(
                  relativeIndex: 0,
                  label: "Home",
                  activeColor: Colors.blue,
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
                NavItem(
                  relativeIndex: 1,
                  label: "Rounds",
                  activeColor: Colors.blue,
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                ),
                NavItem(
                  relativeIndex: 2,
                  label: "Question",
                  activeColor: Colors.blue,
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                ),
              ],
            ).getNavBar(
                DeviceType.desktop.currentDevice(constraints.maxWidth - 200)),
          );
        },
      ),
    );
  }
}
