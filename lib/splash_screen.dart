import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share_preference/home_page.dart';
import 'package:share_preference/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool("isLogin") ?? false;
    if (isLogin) {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LogInScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage(
            "https://images.pexels.com/photos/2695618/pexels-photo-2695618.jpeg?cs=srgb&dl=pexels-vlad-che%C8%9Ban-2695618.jpg&fm=jpg&_gl=1*v42g2y*_ga*NzMxMzYyMjMwLjE2NjMwNTIzNjU.*_ga_8JE65Q40S6*MTY2NjY4ODk5OC4xNC4xLjE2NjY2ODk4MTUuMC4wLjA."),
      ),
    );
  }
}
