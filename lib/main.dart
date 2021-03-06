import 'package:flutter/material.dart';
import 'package:tacaro/modules/feed/feed_page.dart';
import 'package:tacaro/modules/home/home_page.dart';
import 'package:tacaro/modules/login/pages/create_account/create_account.dart';
import 'package:tacaro/modules/login/pages/login_page.dart';
import 'package:tacaro/modules/splash/splash_page.dart';
import 'package:tacaro/shared/models/user_model.dart';

import 'modules/profile/profile_page.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Race 1",
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/login/create_account": (context) => CreateAccountPage(),
        "/home": (context) => HomePage(pages: [
              FeedPage(),
              ProfilePage(),
            ], user: ModalRoute.of(context)!.settings.arguments as UserModel),
      },
    );
  }
}
