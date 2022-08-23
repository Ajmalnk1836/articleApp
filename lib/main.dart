import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newsapp/app/modules/authenticationscreen/controllers/authenticationscreen_controller.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
  .then((value) => Get.put(AuthenticationscreenController()));

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
