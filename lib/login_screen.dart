import 'package:flutter/material.dart';
import 'package:share_preference/home_page.dart';
import 'package:share_preference/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailcontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final List<String> usertype = [
    "admin",
    "student",
    "teacher",
  ];
  String? _selectedUser = "";


  @override
  Widget build(BuildContext context) {
    // userType() {
    //   _selectedUser = usertype[0];
    // }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Signup"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: Passwordcontroller,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: agecontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Age",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton(
              value: _selectedUser,
              items: usertype.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedUser = value;
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();

                sp.setString("email", emailcontroller.text.toString());
                sp.setString("age", agecontroller.text.toString());
                sp.setBool("isLogin", true);
                sp.setString("usertype", "student");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentScreen()));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text("Login"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
