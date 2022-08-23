import 'package:flutter/material.dart';
import 'package:get/get.dart';

getheight(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.height * percentage / 100;
}

getwidth(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * percentage / 100;
}

checkFieldEmpty(String fieldContent) {
  if (fieldContent.isEmpty && fieldContent.length > 2) {
    return Get.snackbar("Add valid name", "Please add valid address");
  }
  return null;
}

Padding textfeilds(String hintext, IconData Prefixicon, bool obstucuretext,
        TextEditingController controller, bool checktextfeild) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: TextFormField(
        controller: controller,
        obscureText: obstucuretext,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            filled: true,
            hintText: hintext,
            prefixIcon: Icon(
              Prefixicon,
              color: Colors.black,
            ),
            fillColor: Colors.white),
      ),
    );
