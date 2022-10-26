import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';
class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String email="" , age="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  @override

  loadData ()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email")?? "";
    age = sp.getString("age")?? "";
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:Text("Student View"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Email"),
                Text(email.toString()),
                // Text(sp.getString("email")),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Age"),
                Text(age.toString()),
              ],
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                print(sp.getString("email"));
                sp.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogInScreen())
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.green,
                child: Center(
                  child: Text("Logout"),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

