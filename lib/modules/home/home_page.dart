import 'package:flutter/material.dart';

import 'package:tacaro/modules/create/create_bottomsheet.dart';
import 'package:tacaro/modules/profile/profile_page.dart';
import 'package:tacaro/shared/models/user_model.dart';
import 'package:tacaro/shared/theme/app_theme.dart';
import 'package:tacaro/shared/widgets/bottom_navigator/app_bottom_navigator.dart';

class HomePage extends StatefulWidget {
  final List<Widget> pages;
  final UserModel user;
  const HomePage({
    Key? key,
    required this.pages,
    required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  late final List<Widget> pages = widget.pages;
  void changeIndex(int index) async {
    if (index == 3) {
      await showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          context: context,
          builder: (context) => CreateBottomsheet());
    } else if (index == 1) {
      await showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32))),
          context: context,
          builder: (context) => ProfilePage());
    } else {
      currentIndex = index;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              key: UniqueKey(),
              child: List.from(pages)[currentIndex],
            ),
            Positioned(
              bottom: 14,
              left: 26,
              right: 26,
              child: AppBottomNavigator(
                currentIndex: currentIndex,
                onChanged: changeIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
