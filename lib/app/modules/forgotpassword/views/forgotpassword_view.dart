import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newsapp/app/modules/authenticationscreen/controllers/authenticationscreen_controller.dart';
import 'package:newsapp/app/modules/constants/constants.dart';
import 'package:newsapp/app/modules/loginscreen/views/loginscreen_view.dart';

import '../controllers/forgotpassword_controller.dart';

class ForgotpasswordView extends GetView<ForgotpasswordController> {
  TextEditingController confirmemail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      height: getheight(context, 100),
      width: getwidth(context, 100),
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back)),
          ),
          SizedBox(
            height: 50,
          ),
          hellotherewidget(context),
          textfeilds("Enter email", Icons.email, false, confirmemail, false),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: Container(
                height: getheight(context, 6),
                width: getwidth(context, 40),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25)),
                child: TextButton(
                    onPressed: () {
                      AuthenticationscreenController.instance
                          .sendPasswrodReset(confirmemail.text);
                    },
                    child: Text(
                      "Sent otp ",
                      style: TextStyle(color: Colors.white),
                    ))),
          ),
        ],
      ),
    )));
  }
}
