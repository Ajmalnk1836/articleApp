import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/app/modules/constants/constants.dart';

import '../controllers/authenticationscreen_controller.dart';

class AuthenticationscreenView extends GetView<AuthenticationscreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: getheight(context, 100),
          width: getwidth(context, 100),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ), 
          ),
          child: Center(
            child: Icon(
              Icons.newspaper,
              color: Colors.white,
              size: 45 ,
            ),
          )),
    );
  }
}
