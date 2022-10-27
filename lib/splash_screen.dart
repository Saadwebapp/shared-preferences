import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share_preference/admin_screen.dart';
import 'package:share_preference/home_page.dart';
import 'package:share_preference/login_screen.dart';
import 'package:share_preference/student_screen.dart';
import 'package:share_preference/teacher_screen.dart';
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
    String type = sp.getString("usertype")?? "";
    if (isLogin) {
      if(type == "student") {
        Timer(Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StudentScreen()));
        });
      } else if (type == "teacher") {
        Timer(Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TeacherScreen()));
        });
      }else if (type == "admin") {
        Timer(Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminScreen()));
        });
      }
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
        image: AssetImage("assets/img1.webp"),
      ),
    );
  }
}
