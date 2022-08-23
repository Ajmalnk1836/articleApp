import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/app/modules/authenticationscreen/controllers/authenticationscreen_controller.dart';
import 'package:newsapp/app/modules/constants/constants.dart';
import 'package:newsapp/app/modules/forgotpassword/views/forgotpassword_view.dart';
import 'package:newsapp/app/modules/home/views/home_view.dart';
import 'package:newsapp/app/modules/signupscreen/views/signupscreen_view.dart';

import '../controllers/loginscreen_controller.dart';

class LoginscreenView extends GetView<LoginscreenController> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          height: getheight(context, 100),
          width: getwidth(context, 100),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 120,
              ),
              hellotherewidget(context),
              SizedBox(
                height: 50,
              ),
              textfeilds("Email", Icons.email, false, emailcontroller, false),
              SizedBox(
                height: 20,
              ),
              textfeilds(
                  "Password", Icons.password, true, passwordcontroller, false),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: GestureDetector(
                        onTap: () {
                          Get.to(ForgotpasswordView());
                        },
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(color: Colors.blue),
                        )),
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Container(
                    height: getheight(context, 8),
                    width: getwidth(context, 60),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25)),
                    child: TextButton(
                        onPressed: () {
                          AuthenticationscreenController.instance.login(
                              emailcontroller.text.trim(),
                              passwordcontroller.text.trim());
                        },
                        child: Text(
                          "LOGIN ",
                          style: TextStyle(color: Colors.white),
                        ))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New to Article ?"),
                  TextButton(
                      onPressed: () {
                        //  Get.to(()=> SignupscreenController());
                        Get.to(() => SignupscreenView());
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              )
            ]),
          ),
        )));
  }
}

Container hellotherewidget(BuildContext context) {
  return Container(
      width: getwidth(context, 90),
      height: getheight(context, 20),
      // color: Colors.red ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: ' Hello\n There',
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                ),
                children: [
                  TextSpan(
                    text: '.',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                ]),
          )
        ],
      ));
}
