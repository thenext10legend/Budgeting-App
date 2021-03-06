// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:budget_x/pages/drawer.dart';
import 'package:budget_x/pages/root_app.dart';
import 'package:budget_x/pages/signUp_page.dart';
import 'package:budget_x/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyProfilePage extends StatefulWidget {
  @override
  MyProfilePageState createState() => MyProfilePageState();
}

class MyProfilePageState extends State<MyProfilePage> {
  static var dropDownValue = "None";
  TextEditingController email = TextEditingController()
    ..text = MySignUpPageState.email;
  TextEditingController phone_number = TextEditingController()
    ..text = MySignUpPageState.phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Vx.hexToColor("#FF6600"),
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/profile.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              MySignUpPageState.name,
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              MySignUpPageState.username,
              style: GoogleFonts.inter(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    controller: email,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                    ),
                  ),
                  TextField(
                    controller: phone_number,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      labelText: "Phone Number",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: "Gender".text.semiBold.size(19).make(),
                    trailing: DropdownButton<String>(
                      value: dropDownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                      items: <String>["None", "Male", "Female", "Other"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    child: InkWell(
                      child: ElevatedButton(
                        onPressed: () async {
                          await Future.delayed(Duration(milliseconds: 900));
                          await Navigator.pushNamed(
                              context, MyRoute.passwordRoute);
                        },
                        child: Text(
                          "Change Password",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Vx.hexToColor("#FF6600"),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    child: InkWell(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Edit Profile",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Vx.hexToColor("#FF6600"),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: InkWell(
                      child: MaterialButton(
                        onPressed: () async {
                          RootAppState.pageIndex = 0;
                          await Future.delayed(Duration(milliseconds: 900));
                          await Navigator.pushNamed(
                              context, MyRoute.loginRoute);
                        },
                        child: Text(
                          "Log Out",
                          style: GoogleFonts.inter(
                            color: Vx.hexToColor("#FF0000"),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Delete User Data",
                          style: GoogleFonts.inter(
                            color: Vx.hexToColor("#FF0000"),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: MyDrawer(),
      ),
    );
  }
}
