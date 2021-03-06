// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:budget_x/pages/signUp_page.dart';
import 'package:budget_x/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class phoneLogin extends StatefulWidget {
  @override
  phoneLoginState createState() => phoneLoginState();
}

class phoneLoginState extends State<phoneLogin> {
  var mykey = GlobalKey<FormState>();
  static var number;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Vx.hexToColor("#151B28"),
        body: Center(
          child: Container(
            height: 440,
            width: 330,
            decoration: BoxDecoration(
              color: Vx.hexToColor("#262E3D"),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Form(
                key: mykey,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        "assets/images/logo.png",
                        height: 61,
                        width: 230,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        child: Container(
                          height: 40,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Pls enter your phone number";
                              } else if (value.length != 10) {
                                return "Pls enter 10-digit number";
                              }
                              if (value.isNotEmpty && value.length == 10) {
                                number = value;
                              }
                              if (MySignUpPageState.phoneNumber != number) {
                                return "Pls enter valid number";
                              }
                            },
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 10, left: 10),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Phone Number",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 350,
                        child: Material(
                          child: InkWell(
                            child: ElevatedButton(
                              onPressed: () async {
                                if (mykey.currentState?.validate() == true &&
                                    MySignUpPageState.phoneNumber == number) {
                                  await Future.delayed(
                                    Duration(milliseconds: 900),
                                  );
                                  await Navigator.pushNamed(
                                      context, MyRoute.OTPRoute);
                                }
                              },
                              child: Text(
                                "Send OTP",
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
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Or continue using",
                        style: GoogleFonts.inter(fontSize: 11),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                            width: 135,
                            child: InkWell(
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  await Future.delayed(
                                      Duration(milliseconds: 900));
                                  await Navigator.pushNamed(
                                      context, MyRoute.loginRoute);
                                },
                                icon: Icon(Icons.email),
                                label: Text("Mail"),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Vx.hexToColor("#FF6600"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 135,
                            height: 40,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Vx.hexToColor("#FF6600"),
                                  ),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      "assets/images/google.png",
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Google",
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 55,
                          ),
                          Text(
                            "Don't have an account?",
                            style: GoogleFonts.inter(fontSize: 11),
                          ),
                          InkWell(
                            onTap: () async {
                              //await Future.delayed(Duration(milliseconds: 900));
                              await Navigator.pushNamed(
                                  context, MyRoute.signUpRoute);
                            },
                            child: Text(
                              "Signup",
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
