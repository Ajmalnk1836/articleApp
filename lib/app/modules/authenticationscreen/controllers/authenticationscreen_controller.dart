import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/modules/home/views/home_view.dart';
import 'package:newsapp/app/modules/loginscreen/views/loginscreen_view.dart';
import 'package:newsapp/app/modules/models/model.dart';
import 'package:newsapp/app/modules/splashscreen/views/splashscreen_view.dart';

class AuthenticationscreenController extends GetxController {
  //TODO: Implement AuthenticationscreenController
  static AuthenticationscreenController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  final count = 0.obs;
  @override
  void onInit() {
    
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());

    ever(_user, _initailscreen);
  }

  void _initailscreen(User? user)async {
     await Future.delayed(Duration(seconds: 2));
  //  Timer(Duration(seconds: 4), )   
  
    user == null ? Get.offAll(LoginscreenView()) : Get.offAll(HomeView());
  }

  void register(String name, String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      final docUser = FirebaseFirestore.instance.collection("users").doc();
      final usermodel =
          Usermodel(id: docUser.id, uid: user.uid, email: email, uname: name);
      final json = usermodel.toJson();
      await docUser.set(json);
      Get.snackbar("Suucessfull", "congrats",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
      await Get.offAll(HomeView());
    } catch (e) {
      Get.snackbar("About user", "Not matcthed",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void sendPasswrodReset(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email).then((value) => {
            Get.offAll(LoginscreenView()),
            Get.snackbar("Password reset email link is been sent", "Success")
          });
    } catch (e) {
      print(e);
      Get.snackbar(e.toString(), "Youe enterd mail is error");
    }
  }

  void logout() async {
    await auth.signOut();
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Login failed ",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
